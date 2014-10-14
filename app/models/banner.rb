class Banner < ActiveRecord::Base

  mount_uploader :img, BannersUploader

  scope :recent, -> { order("created_at desc") }

  def date_formate
    self.updated_at.strftime("%Y/%m/%d")
  end

  validates_presence_of :img

end
