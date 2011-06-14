# == Schema Information
# Schema version: 20110613164425
#
# Table name: memberships
#
#  id         :integer         not null, primary key
#  member_id  :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Membership < ActiveRecord::Base
  attr_accessible :member_id, :group_id
  
  belongs_to :member
  belongs_to :group
end
