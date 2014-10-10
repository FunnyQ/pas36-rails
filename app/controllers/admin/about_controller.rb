class Admin::AboutController < ApplicationController

  def index
    @news = News.all
  end

end
