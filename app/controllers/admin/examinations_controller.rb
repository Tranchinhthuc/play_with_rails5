class Admin::ExaminationsController < Admin::Base
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
    @listening = params[:question_ids].present? ? Listening.new(permit_params) : Listening.build_auto
    if @listening.save
      redirect_to admin_listening_path(@listening)
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
    @listening = Listening.find(params[:id])
    if @listening.update_attributes(permit_params)
      redirect_to [ :admin, @listening ]
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
      part_one: PartOne.all,
      part_two: PartTwo.all,
      part_three: PartThree.all,
      part_four: PartFour.all,
      part_five: PartFive.all,
      part_six: PartSix.all,
      part_seven_one: PartSevenOne.all,
      part_seven_two: PartSevenTwo.all
    }
  end
end
