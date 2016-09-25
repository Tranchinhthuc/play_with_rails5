class Admin::ListeningLessonsController < ApplicationController
  load_and_authorize_resource :examination
  include LessonStandardActions

  def index
    lesson_standard_index
  end

  def show
    lesson_standard_show
  end

  def new
    fetch_questions
    @listening_lesson = Examination.new
  end

  def create
    @listening_lesson = current_user.examinations.build(permit_params)
    @listening_lesson.question_ids = params[:question_ids]
    if @listening_lesson.save
      redirect_to action: :index
    else
      fetch_questions
      render :new
    end
  end

  def edit
    @listening_lesson = Examination.find(params[:id])
    fetch_questions
  end

  def update
    @listening_lesson = Examination.find(params[:id])
    if @listening_lesson.update_attributes(question_ids: params[:question_ids])
      redirect_to action: :index
    else
      fetch_questions
      render :edit
    end
  end

  def destroy
    lesson_standard_destroy
  end

  private
  def permit_params
    params.require(:examination).permit(:examination_type, :question_ids => [])
  end

  def fetch_questions
    @questions = {
      part_one: PartOne.all,
      part_two: PartTwo.all,
      part_three: PartThree.all,
      part_four: PartFour.all
    }
  end
end
