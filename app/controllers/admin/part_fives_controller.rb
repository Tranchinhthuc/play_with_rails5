class Admin::PartFivesController < Admin::Base
  include StandardActions

  def index
    standard_index
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

  def edit
    standard_edit
  end

  def update
    update_with_sub_questions
  end

  def destroy
    standard_destroy
  end
end
