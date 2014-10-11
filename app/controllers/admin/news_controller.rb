class Admin::NewsController < ApplicationController

  layout "admin"

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to admin_index_path
    else
      render :new
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])

    if @news.update(news_params)
      redirect_to admin_index_path
    else
      render :edit
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to admin_index_path
  end

  private

  def news_params
    params.require(:news).permit(:title, :img, :content, :bootsy_image_gallery_id)
  end

end
