class ArticlesController < ApplicationController
  before_action :get_articles, only: [:show, :update, :destroy, :edit, :like]
  before_action :article_params, only: [:create, :update]
  def index
    @articles = Article.public_article
  end

  def private_article
    @articles = Article.private_article
  end

  def show
    @attibutes = (@article.images + @article.texts).sort_by &:no
  end

  def edit
  end

  def update
    return redirect_to article_path(@article), notice: "Create success!" if @article.update(@articles_params)

    redirect_to :new
    flash[:alert] = "Create error"
  end

  def create
    @article = Article.new(@articles_params)
    return redirect_to new_article_image_path(@article), notice: "Create success!" if @article.save
    render :new
    flash[:alert] = "Create error"
  end

  def new
    @article = Article.new
  end

  def destroy
    return redirect_to articles_path, notice: "Delete success!" if @article.destroy
    redirect_to articles_path,
    flash[:alert] = "Delete error"
  end

  def like
    like_compoment(@article,@article, 'Like article success', 'Error not like')
  end

  private
    def article_params
      @articles_params = params.require(:article).permit(:title, :date_up, :like)
    end
    def get_articles
      @article = Article.find(params[:id])
    end
end
