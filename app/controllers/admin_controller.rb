class AdminController < ApplicationController

  layout "admin"

  def index
    @news = News.all.recent.paginate(:page => params[:page], :per_page => 5)
    @sliders = IndexSlider.all.recent.paginate(:page => params[:page], :per_page => 5)
    @banners = Banner.all
  end
  def about

  end

end
