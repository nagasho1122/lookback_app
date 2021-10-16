class StaticPagesController < ApplicationController
  skip_before_action :check_logged_in, only: :home
  
  def home
    @logo_color_red = true
  end
end
