require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:article) { create(:article) }

  describe '#index' do
    let!(:articles) { create_list(:article, 5) }
    it 'gets a list of products' do
      get :index
      expect(assigns(:articles).size).to eq articles.size
    end
  end

  describe '#new' do
    it 'create a article' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe '#show' do
    it 'show article' do
      get :show, params: { id: article.id }
      expect(assigns(:article).id).to eq article.id
    end
  end

  describe '#edit' do
    it 'edit article' do
      get :edit, params: { id: article.id }
      expect(assigns(:article).id).to eq article.id
    end
  end

  describe '#create' do
    context 'success' do
      it "creates a new product" do
        expect{
          post :create, params: { article: FactoryBot.attributes_for(:article) }
        }.to change(Article, :count).by(1)
        expect(response).to redirect_to new_article_image_path(assigns(:article).id)
      end
    end
    context 'fail' do
      it "creates a new fails" do
        post :create, params: { article: FactoryBot.attributes_for(:article, like: -1) }
        expect(response).to render_template :new
      end
    end
  end

  describe '#delete' do
    let!(:article) { create(:article) }
    it 'delete articel' do
      expect{
        delete :destroy, params: {id: article.id}
      }.to change(Article, :count).by(-1)
      expect(response).to redirect_to articles_path
    end
  end

  describe 'put/update' do
    it 'update' do
      article_params = { title: 'new title'}
      put :update, params: { id: article.id, article: article_params }
      expect(assigns(:article).title).to eq(article_params[:title])
      response.should redirect_to assigns(:article)
    end
  end

  describe 'like' do
    it 'update like' do
      get :like, params: {id: article.id}
      expect(assigns(:article).like).to eq(article.like+1)
    end
  end

  describe '#index#private' do
    let!(:articles) { create_list(:article, 5, date_up: Time.now + 10*60*60) }
    it 'gets a list articles private' do
      get :private_article
      expect(assigns(:articles).size).to eq articles.size
    end
  end


end
