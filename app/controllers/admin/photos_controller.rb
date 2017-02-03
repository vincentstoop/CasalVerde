class Admin::PhotosController < Admin::BaseController
  def index
    @photos = Photo.all
    @page = Page.find(params[:page_id])
    @carousel = Carousel.find(params[:carousel_id])
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @page = Page.find(params[:page_id])
    @photo.photo_page_id = @page.id
    @photo.photo_page_type = "Carousel"

    if @photo.save
      redirect_to controller: :photos, action: :index
    else
      render "index"
    end
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
      render "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @carousel = Carousel.find(params[:carousel_id])
    @page = Page.find(params[:page_id])

    if @photo.destroy
      redirect_to admin_page_carousel_photos_path
    else
      redirect_to admin_page_carousel_photos_path, notice: "Fuck you"
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image)

  end
end
