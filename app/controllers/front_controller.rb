class FrontController < ApplicationController

  def index
    @news = News.all
    @sliders = IndexSlider.all
  end

  def about
    @abouts = About.all
  end

  def spaces

  end

  def courses

  end

  def activities

  end

  def downloads

  end

end
