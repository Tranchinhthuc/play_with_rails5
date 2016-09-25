class PartFivesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  include UserSideStandardActions

  def index
    @part_fives = current_user.part_fives
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
