class Admin::CarouselsController < Admin::BaseController
  def index
    @page = Page.find(params[:page_id])
  end
end
