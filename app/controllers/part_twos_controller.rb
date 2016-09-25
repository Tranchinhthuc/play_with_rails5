class PartTwosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  include UserSideStandardActions

  def index
    @part_twos = current_user.part_twos
  end

  def show
    standard_show
  end

  def new
    new_with_sub_questions
  end

  def create
    create_with_sub_questions
  end
end
