class Admin::AboutsController < ApplicationController

  layout "admin"

  def index
    @abouts = About.all
  end

  def show

  end

  def new
    @abouts = About.new
  end

  def create
    @abouts = About.new(about_params)

    if @abouts.save
      redirect_to admin_abouts_path
      flash[:notice] = "已成功建立 #{@abouts.title}"
    else
      render :new
      flash[:alert] = "#{@abouts.title} 並未順利建立，請您檢查後再試一次。"
    end
  end

  def edit
    @abouts = About.find(params[:id])
  end

  def update
    @abouts = About.find(params[:id])

    if @abouts.update(about_params)
      redirect_to admin_abouts_path
      flash[:notice] = "#{@abouts.title} 已成功更新！"
    else
      render :edit
      flash[:alert] = "#{@abouts.title} 並未順利更新，請您檢查後再試一次。"
    end
  end

  def destroy
    @abouts = About.find(params[:id])
    @abouts.destroy
    redirect_to admin_abouts_path
  end

  private

  def about_params
    params.require(:about).permit(:title, :pic, :anchor, :content)
  end

end
