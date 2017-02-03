class Admin::CarouselsController < Admin::BaseController
  def index
    @carousels = Carousel.all
  end
end
