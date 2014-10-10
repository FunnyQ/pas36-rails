class FrontController < ApplicationController

  def index
    @news = News.all
  end

  def about
    @abouts = About.all
  end

end
