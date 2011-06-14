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
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :first_name,        :presence     => true,
                                :length       => { :maximum => 50 }
  
  validates :last_name,         :presence     => true,
                                :length       => { :maximum => 50 }
                               
  validates :email,             :presence     => true,
                                :format       => { :with => email_regex },
                                :uniqueness   => { :case_sensitive => false }
  
  # Automatically create the virtual accessible attribute 'password confirmation'
  validates :password,        :presence     => true,
                              :confirmation => true,
                              :length       => { :within => 6..40 }
                              
  has_many :memberships
  has_many :group, :through => :memberships
end
