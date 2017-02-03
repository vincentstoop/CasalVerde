class Admin::ParagraphsController < Admin::BaseController

  def index
    @paragraphs = Paragraph.all.order(id: :asc)
    @page = Page.find(params[:page_id])
  end

  def edit
    @paragraph = Paragraph.find(params[:id])
    @page = Page.find(params[:page_id])
    @paragraph.page_id = @page.id
  end

  def update
    paragraph = Paragraph.find(params[:id])

    if paragraph.update(paragraph_params)
      redirect_to admin_page_paragraphs_path
    else
      render :edit
    end
  end

  private

  def paragraph_params
    params.require(:paragraph).permit(:text)
  end
end
