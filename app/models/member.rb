# == Schema Information
# Schema version: 20110614134645
#
# Table name: members
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  date_of_birth      :date
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

require 'digest'

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
  
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    member = find_by_email(email)
    return nil if member.nil?
    return member if member.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    member = find_by_id(id)
    (member && member.salt == cookie_salt) ? member : nil
  end

  private
  
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
end
