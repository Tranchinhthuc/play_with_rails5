class Toeic::DocumentsController < Admin::Base
  include StandardActions

  def index
    standard_index
  end

  def show
    standard_show
  end

  def new
    standard_new
  end

  def create
    params[:document][:subject_ids] = params[:subject_ids] if params[:document][:subject_ids].nil?
    @document = current_user.documents.build permit_params
    if @document.save
      redirect_to toeic_documents_path
    else
      render :new
    end
  end

  def edit
    standard_edit
  end

  def update
    params[:document][:subject_ids] = params[:subject_ids] if params[:document][:subject_ids].nil?
    @documents = Document.find params[:id]
    if @documents.update_attributes(permit_params)
      redirect_to toeic_documents_path
    else
      render :edit
    end
  end

  def destroy
    standard_destroy
  end

  private
  def permit_params
    params.require(:document).permit(:book_link, :audio_link, :audio_point, :book_point, :title, :description, subject_ids: [])
  end
end
