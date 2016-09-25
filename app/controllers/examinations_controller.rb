class ExaminationsController < ApplicationController
  before_action :authenticate_user!
  include StandardActions

  def index
    @examinations = Examination.half_test
  end


  def buy_examination
    examination = Examination.find params[:id]
    current_user.buy_examination(examination)
    redirect_to(params[:redirect] == 'true' ? new_examination_answer_sheet_path(examination) : :back)
  end
end
