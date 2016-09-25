class Admin::PartSevenTwoLessonsController < ApplicationController
  load_and_authorize_resource :examination
  include LessonStandardActions

  def index
    lesson_standard_index
  end

  def show
    lesson_standard_show
  end

  def new
    lesson_standard_new
  end

  def create
    lesson_standard_create
  end

  def edit
    lesson_standard_edit
  end

  def update
    lesson_standard_update
  end

  def destroy
    lesson_standard_destroy
  end

  private
  def permit_params
    params.require(:examination).permit(:point, :examination_type, :question_ids => [])
  end
end
