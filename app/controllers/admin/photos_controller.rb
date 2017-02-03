class Admin::PhotosController < Admin::BaseController
  def index
    @photos = Photo.all
  end
  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])
    photo.image = params(:image)

    if photo.update
      redirect_to controller: :photos, action: :index
    else
      render :edit
    end

  end
end
