class News < ActiveRecord::Base
  include Bootsy::Container
  mount_uploader :img, NewscoverUploader

  validates_presence_of :title, :img, :content
end
