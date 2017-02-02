class Admin::PagesController < Admin::BaseController
  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find(params[:id])
  end
end
