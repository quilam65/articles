class TextsController < ApplicationController
  before_action :get_Texts, only: [:update, :destroy, :edit, :like]
  before_action :text_params, only: [:create, :update]

  def update
    return redirect_to edit_article_path(@text.article), notice: 'Update success!' if @text.update(@texts_params)
    redirect_to edit_article_text_path(:article_id => @text.article, id: @text),
    flash[:alert] = 'Create error'
  end

  def create
    @text = Text.new(@texts_params)
    return redirect_to article_path(@text.article_id), notice: 'Create success!' if @text.save
    render :new
    flash[:alert] = 'Create error'
  end

  def new
    @text = Text.new
  end

  def destroy
    return redirect_to edit_article_path(@text.article), notice: 'Delete success!' if @text.destroy
    redirect_to articles_path
    flash[:alert] = 'Delete error'
  end

  def like
    like_compoment(@text, @text.article,'Like text success!', 'Error not like')
  end
  private
    def text_params
      @texts_params = params.require(:text).permit(:headline, :no, :content, :article_id, :like)
    end
    def get_Texts
      @text = Text.find(params[:id])
    end
end
