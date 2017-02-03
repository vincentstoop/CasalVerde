class Admin::PhotosController < Admin::BaseController
  def index
    @photos = Photo.all
    @page = Page.find(params[:page_id])
    @carousel = Carousel.find(params[:carousel_id])
  end
  def edit
    @photo = Photo.find(params[:id])
    @page = Page.find(params[:page_id])
    @carousel = Carousel.find(params[:carousel_id])
  end

  def update
    photo = Photo.find(params[:id])

    if photo.update(photo_params)
      redirect_to controller: :photos, action: :index
    else
      render :edit
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end
end
