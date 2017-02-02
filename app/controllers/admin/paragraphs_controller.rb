class Admin::ParagraphsController < Admin::BaseController

  def index
    @paragraphs = Paragraph.all.order(id: :asc)
  end

  def edit
    @paragraph = Paragraph.find(params[:id])
  end

  def update
    paragraph = Paragraph.find(params[:id])

    if paragraph.update(paragraph_params)
      redirect_to admin_paragraphs_path
    else
      render :edit
    end
  end

  private

  def paragraph_params
    params.require(:paragraph).permit(:text)
  end
end
