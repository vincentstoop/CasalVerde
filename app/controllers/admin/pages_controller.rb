class Admin::PagesController < Admin::BaseController
  def index
    @pages = Page.all
    @homepage = Page.find_by(name: "home_page")
    @photos = Photo.all
  end

  def edit
    @page = Page.find(params[:id])
  end
end
