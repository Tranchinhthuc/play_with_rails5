class StaticPagesController < ApplicationController
  def home
  end

  def baokim
    render layout: false
  end

  def nganluong
    render layout: false
  end
end
