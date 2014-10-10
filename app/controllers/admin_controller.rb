class AdminController < ApplicationController

  layout "admin"

  def index
    @news = News.all
  end

end
