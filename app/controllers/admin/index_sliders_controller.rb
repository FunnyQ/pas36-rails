class Admin::IndexSlidersController < ApplicationController

  layout "admin"

  def image
    @slider = IndexSlider.new
  end

  def link
    @slider = IndexSlider.new
  end

  def new
    @slider = IndexSlider.new
  end

  def create
    @slider = IndexSlider.new(index_sliders_params)
    if @slider.save
      redirect_to admin_index_path
      flash[:notice] = "已成功建立 Slider"
    else
      redirect_to :back
      flash[:alert] = "Slider 建立失敗，請您確認欄位皆有填妥並再試一次。"
    end
  end

  def edit
    @slider = IndexSlider.find(params[:id])
  end

  def update
    @slider = IndexSlider.find(params[:id])

    if @slider.update(index_sliders_params)
      redirect_to admin_index_path
      flash[:notice] = "已成功更新！"
    else
      render :edit
      flash[:alert] = "更新失敗，請您檢查後再試一次。"
    end
  end

  def destroy
    @slider = IndexSlider.find(params[:id])
    @slider.destroy
    redirect_to admin_index_path
    flash[:notice] = "Slider 已刪除！"
  end

  private

  def index_sliders_params
    params.require(:index_slider).permit(:category, :link, :img, :news_id)
  end

end
