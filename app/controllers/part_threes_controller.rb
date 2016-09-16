class PartThreesController < ApplicationController
  load_and_authorize_resource
  include UserSideStandardActions

  def index
    @part_threes = current_user.part_threes
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
