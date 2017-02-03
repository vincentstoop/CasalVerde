class Admin::PagesController < Admin::BaseController
  def index
    @pages = Page.all
    @homepage = Page.find_by(name: "home_page")
    @photos = Photo.all
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.hidden = true

    if @page.save
      redirect_to admin_pages_path
    else
      render "index"
    end
  end


  def edit
    @page = Page.find(params[:id])
  end

  def update
    page_to_update = Page.find(params[:id])

    if page_to_update.update(page_params)
      redirect_to admin_pages_path
    else
      render :index
    end
  end

  def destroy
    page_to_destroy = Page.find(params[:id])

    if page_to_destroy.destroy
      redirect_to admin_pages_path
    else
      redirect_to admin_pages_path
    end
  end

  private

  def page_params
    params.require(:page).permit(:name, :hidden)
  end
end
