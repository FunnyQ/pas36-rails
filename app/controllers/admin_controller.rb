class AdminController < ApplicationController

  layout "admin"

  def index
    @news = News.all
  end
  def about

  end

end
