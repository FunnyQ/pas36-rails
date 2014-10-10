class F2eController < ApplicationController

  def index
    @news = News.all
  end

end
