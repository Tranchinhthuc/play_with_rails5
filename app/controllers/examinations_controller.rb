class ExaminationsController < ApplicationController
  include StandardActions

  def index
    @examinations = Examination.half_test
  end
end
