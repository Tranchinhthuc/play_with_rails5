class Admin::Base < ApplicationController
  load_and_authorize_resource

  layout "admin"
end