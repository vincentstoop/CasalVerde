class Admin::ParagraphsController < Admin::BaseController

  def index
    @paragraphs = Paragraph.all.order(id: :asc)
    @page = Page.find(params[:page_id])
    @paragraph = Paragraph.new
  end

  def create
    @paragraph = Paragraph.new(paragraph_params)
    @page = Page.find(params[:page_id])
    @paragraph.page_id = @page.id

    if @paragraph.save
      redirect_to admin_page_paragraphs_path
    else
      render "index"
    end
  end

  def update
    paragraph = Paragraph.find(params[:id])

    if paragraph.update(paragraph_params)
      redirect_to admin_page_paragraphs_path
    else
      render :edit
    end
  end

  def destroy
    @paragraph = Paragraph.find(params[:id])
    @page = Page.find(params[:page_id])

    if @paragraph.destroy
      redirect_to admin_page_paragraphs_path
    else
      redirect_to admin_page_paragraphs_path, notice: "Fuck you"
    end
  end

  private

  def paragraph_params
    params.require(:paragraph).permit(:text)
  end
end
