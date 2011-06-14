# == Schema Information
# Schema version: 20110613164425
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  attr_accessible :name
  
  has_many :memberships
  belongs_to :member, :through => :memberships
end
