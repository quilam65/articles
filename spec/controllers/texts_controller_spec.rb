require 'rails_helper'

RSpec.describe TextsController, type: :controller do
  let!(:article) { create(:article) }
  let(:text) { create(:text) }

  describe '#edit' do
    it 'edit text' do
      get :edit, params: { article_id: text.article_id, id: text.id }
      expect(assigns(:text).id).to eq text.id
    end
  end

  describe 'new' do
    it 'new text' do
      get :new, params: {article_id: article.id}
      expect(assigns(:text)).to be_a_new(Text)
    end
  end

  describe '#create' do
    context 'success' do
      it 'create text' do
        expect{
          post :create, params: {article_id: article.id, text: FactoryBot.attributes_for(:text, article_id: article.id)}
        }.to change(Text, :count).by(1)
      end
    end
    context 'fail' do
      it ' create fail text' do
        post :create, params: {article_id: article.id,text: FactoryBot.attributes_for(:text, like: -1, article_id: article.id)}
        expect(response).to render_template :new
      end
    end
  end

  describe '#destroy' do
    let!(:text) { create(:text) }
    context 'success' do
      it "delete text" do
        expect {
          delete :destroy, params: { article_id: article.id, id: text.id }
        }.to change(Text, :count).by(-1)
        expect(response).to redirect_to edit_article_path(text.article_id)
      end
    end
  end

  describe 'like' do
    it 'update like' do
      get :like, params: { article_id: article.id, id: text.id }
      expect(assigns(:text).like).to eq(text.like+1)
    end
  end


end
