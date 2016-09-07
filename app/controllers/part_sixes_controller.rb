class PartSixesController < ApplicationController
  load_and_authorize_resource
  include UserSideStandardActions

  def index
    @part_sixes = current_user.part_sixes
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
