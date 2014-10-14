class Admin::BannersController < ApplicationController

  layout "admin"

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      redirect_to admin_index_path
      flash[:notice] = "Banner 成功建立！"
    else
      render :new
      flash[:alert] = "Banner 並未成功建立，請檢查後再試一次。"
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update(banner_params)
      redirect_to admin_index_path
      flash[:notice] = "Banner 成功更新！"
    else
      render :edit
      flash[:alert] = "Banner 並未成功更新，請檢查後再試一次。"
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    redirect_to admin_index_path
    flash[:notice] = "Banner 已刪除！"
  end

  private

  def banner_params
    params.require(:banner).permit(:img, :link)
  end

end
