class Admin::CarouselsController < Admin::BaseController
  def index
    @carousels = Carousel.all
    @page = Page.find(params[:page_id])
  end
end
