class Admin::SubjectsController < Admin::Base
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
    @subject = Subject.new permit_params
    if @subject.save
      redirect_to admin_subjects_path
    else
      render :new
    end
  end

  def edit
    standard_edit
  end

  def update
    @subjects = Subject.find params[:id]
    if @subjects.update_attributes(permit_params)
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def destroy
    standard_destroy
  end

  private
  def permit_params
    params.require(:subject).permit(:title, :description, :active, :url)
  end
end
