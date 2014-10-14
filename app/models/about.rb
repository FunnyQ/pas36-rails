# == Schema Information
#
# Table name: abouts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  anchor     :string(255)
#  pic        :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class About < ActiveRecord::Base
  include Bootsy::Container
end
