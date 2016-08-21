class Admin::ReadingsController < Admin::Base
  include StandardActions

  def index
    standard_index
  end

  def show
    standard_show
  end

  def new
    fetch_questions
    standard_new
  end

  def create
    @reading = params[:question_ids].present? ? Reading.new(permit_params) : Reading.build_auto
    if @reading.save
      redirect_to admin_reading_path(@reading)
    else
      fetch_questions
      render "new"
    end
  end

  def edit
    fetch_questions
    standard_edit
  end

  def update
    @reading = Reading.find(params[:id])
    if @reading.update_attributes(permit_params)
      redirect_to [ :admin, @reading ]
    else
      fetch_questions
      render :edit
    end
  end

  def destroy
    standard_destroy
  end

  private
  def permit_params
    params.permit({:question_ids => []})
  end

  def fetch_questions
    @questions = {
      part_five: PartFive.all,
      part_six: PartSix.all,
      part_seven_one: PartSevenOne.all,
      part_seven_two: PartSevenTwo.all
    }
  end
end
