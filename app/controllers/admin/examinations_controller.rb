class Admin::ExaminationsController < Admin::Base
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
    # @examination = Examination.build_auto
    # if @examination.save
    #   redirect_to admin_examination_path(@examination)
    # else
    #   redirect_to :back
    # end
    standard_create
  end

  def edit
    standard_edit
  end

  def update
    standard_update
  end

  def destroy
    standard_destroy
  end

  private
  def permit_params
    params.fetch(:examination, {}).permit(:listening_id, :reading_id)
  end
end
