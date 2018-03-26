require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:image) { create(:image) }
  let!(:article) { create(:article) }
  describe '#edit' do
    it 'edit image' do
      get :edit, params: { article_id: image.article_id, id: image.id }
      expect(assigns(:image).id).to eq image.id
    end
  end

  describe 'new' do
    it 'new image' do
      get :new, params: {article_id: article.id}
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe '#create' do
    context 'success' do
      it 'create image' do
        expect{
          post :create, params: {article_id: article.id, image: FactoryBot.attributes_for(:image, article_id: article.id)}
        }.to change(Image, :count).by(1)
      end
    end
    context 'fail' do
      it ' create fail image' do
        post :create, params: {article_id: article.id,image: FactoryBot.attributes_for(:image, like: -1, article_id: article.id)}
        expect(response).to render_template :new
      end
    end
  end

  describe '#destroy' do
    let!(:image) { create(:image) }
    context 'success' do
      it "delete image" do
        expect {
          delete :destroy, params: { article_id: article.id, id: image.id }
        }.to change(Image, :count).by(-1)
        expect(response).to redirect_to edit_article_path(image.article_id)
      end
    end
  end

  describe 'like' do
    it 'update like' do
      get :like, params: { article_id: article.id, id: image.id }
      expect(assigns(:image).like).to eq(image.like+1)
    end
  end


end
