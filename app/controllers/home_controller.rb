class HomeController < ApplicationController
  def index
  end

  def about
    @about_me = "Dwane is a Full Time DevOps intern at PagerDuty"
  end
end
