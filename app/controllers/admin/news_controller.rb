class Admin::NewsController < ApplicationController

  layout "admin"

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to admin_index_path
      flash[:notice] = "已成功建立新聞！"
    else
      render :new
      flash[:alert] = "新聞建立失敗，請您檢查後再試一次。"
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])

    if @news.update(news_params)
      redirect_to admin_index_path
      flash[:notice] = "已成功更新新聞！"
    else
      render :edit
      flash[:alert] = "新聞更新失敗，請您檢查後再試一次。"
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to admin_index_path
    flash[:notice] = "#{@news.title} 已刪除"
  end

  private

  def news_params
    params.require(:news).permit(:title, :img, :content, :bootsy_image_gallery_id)
  end

end
