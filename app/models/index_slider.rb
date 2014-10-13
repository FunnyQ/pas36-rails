class IndexSlider < ActiveRecord::Base

  mount_uploader :img, IndexSliderUploader

  scope :recent, -> { order("created_at desc") }

  def date_formate
    self.updated_at.strftime("%Y/%m/%d")
  end

  validate :img_xor_link

  private

  def img_xor_link
    if [self.img, self.link].reject(&:blank?).size == 0
      errors.add(:base, "請檢查欄位是否填妥")
    end
  end

end
