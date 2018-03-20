class ImagesController < ApplicationController
  before_action :get_image, only: [:update, :destroy, :edit, :like]
  before_action :image_params, only: [:create, :update]

  def index
    @images = Image.all
  end


  def edit
  end

  def update
    return redirect_to edit_article_path(@image.article), notice: "Update success!" if @image.update(@images_params)
    redirect_to edit_article_image_path(@image.article, @image),
    flash[:alert] = "Create error"
  end

  def create
    @image = Image.new(@images_params)
    return redirect_to new_article_text_path(@image.article), notice: "Create success!" if @image.save
    redirect_to :new,
    flash[:alert] = "Create error"
  end

  def new
    @image = Image.new
  end

  def destroy
    return redirect_to images_path, notice: "Delete success!" if @image.destroy
    redirect_to images_path,
    flash[:alert] = "Delete error"
  end
  def like
    like_compoment(@image,@image.article, 'Like image success', 'Error not like')
  end
  private
    def image_params
        @images_params = params.require(:image).permit(:headline, :no, :image, :article_id)
    end
    def get_image
      @image = Image.find(params[:id])
    end
end
