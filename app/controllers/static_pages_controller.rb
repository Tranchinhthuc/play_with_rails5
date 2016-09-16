class StaticPagesController < ApplicationController
  def home
  end

  def baokim
    render layout: false
  end
end
