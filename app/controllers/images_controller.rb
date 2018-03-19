class ImagesController < ApplicationController
  before_action :get_Texts, only: [:show, :update, :destroy]
  before_action :image_params, only: [:create, :update]
  def index
    @images = Image.all
  end

  def show
  end

  def update
    @image.update(@images_params)
    return redirect_to image_path(@image), notice: "Update success!" if @image.update(@images_params)
    redirect_to :new,
    flash[:alert] = "Create error"
  end

  def create
    @image = Image.new(image_params)
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
  private
    def image_params
        @images_params = params.require(:image).permit(:headline, :no, :image, :article_id)
    end
    def get_Texts
      @image = image.find(params[:id])
    end
end
