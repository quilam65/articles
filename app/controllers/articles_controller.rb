class ArticlesController < ApplicationController
  before_action :get_articles, only: [:show, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def update
    @article.update(article_params)
    return redirect_to article_path(@article), notice: "Create success!" if @article.update(article_params)
    redirect_to :new,
    flash[:alert] = "Create error"
  end

  def create
    @article = Article.new(article_params)
    return redirect_to article_path(@article), notice: "Create success!" if @article.save
    redirect_to :new,
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
  private
    def article_params

    end
    def get_articles
      @article = Article.find(params[:id])
    end
end
