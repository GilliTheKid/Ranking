# == Schema Information
# Schema version: 20110613145123
#
# Table name: members
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  dob        :date
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
  # Automatically create the virtual accessible attribute 'password confirmation'
  validates :password,        :presence     => true,
                              :confirmation => true,
                              :length       => { :within => 6..40 }
                              
  has_many :memberships
  has_many :group, :through => :memberships
end
