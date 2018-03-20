class TextsController < ApplicationController
  before_action :get_Texts, only: [:show, :update, :destroy, :edit]
  before_action :text_params, only: [:create, :update]
  def index
    @texts = Text.all
  end

  def show
  end

  def update
    return redirect_to edit_article_path(@text.article), notice: "Update success!" if @text.update(@texts_params)
    redirect_to edit_article_text_path(:article_id => @text.article, id: @text),
    flash[:alert] = "Create error"
  end

  def create
    @text = Text.new(@texts_params)
    return redirect_to article_path(@text.article_id), notice: "Create success!" if @text.save
    redirect_to :new,
    flash[:alert] = "Create error"
  end

  def new
    @text = Text.new
  end

  def destroy
    return redirect_to texts_path, notice: "Delete success!" if @text.destroy
    redirect_to texts_path,
    flash[:alert] = "Delete error"
  end
  private
    def text_params
      @texts_params = params.require(:text).permit(:headline, :no, :content, :article_id)

    end
    def get_Texts
      @text = Text.find(params[:id])
    end
end
