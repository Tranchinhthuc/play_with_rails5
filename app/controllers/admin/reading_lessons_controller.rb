class Admin::ReadingLessonsController < ApplicationController
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
    @reading_lesson = Examination.new
  end

  def create
    @reading_lesson = current_user.examinations.build(permit_params)
    @reading_lesson.question_ids = params[:question_ids]
    if reading_lesson.save
      redirect_to action: :index
    else
      fetch_questions
      render :new
    end
  end

  def edit
    @reading_lesson = Examination.find(params[:id])
    fetch_questions
  end

  def update
    @reading_lesson = Examination.find(params[:id])
    if @reading_lesson.update_attributes(question_ids: params[:question_ids])
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
    params.require(:examination).permit(:point, :examination_type, :question_ids => [])
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
