class PartFourLessonsController < ApplicationController
  before_action :authenticate_user!
  include LessonStandardActions

  def index
    lesson_standard_index
  end
end
