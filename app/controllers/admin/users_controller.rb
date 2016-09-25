class Admin::UsersController < Admin::Base
  include StandardActions

  def index
    standard_index
  end

  def show
    standard_show
  end

  def new
    standard_new
  end

  def create
    standard_create
  end

  def edit
    standard_edit
  end

  def update
    standard_update
  end

  def destroy
    standard_destroy
  end

  private
  def permit_params
    params.require(:user).permit(:full_name, :password, :avatar, :email)
  end
end
