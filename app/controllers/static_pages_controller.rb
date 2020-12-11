class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def landing_page
  end
end
