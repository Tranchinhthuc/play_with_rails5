class PartSixLessonsController < ApplicationController
  include LessonStandardActions

  def index
    lesson_standard_index
  end
end