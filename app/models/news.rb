# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  img        :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class News < ActiveRecord::Base
  include Bootsy::Container

  mount_uploader :img, NewscoverUploader

  scope :recent, -> { order("created_at desc") }
  scope :recent_5, -> { order("created_at desc").take(5) }

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }
  def next
    News.next(self.id).first
  end
  def previous
    News.previous(self.id).first
  end

  def date_formate
    self.updated_at.strftime("%Y/%m/%d")
  end

  validates_presence_of :title, :img, :content
end
