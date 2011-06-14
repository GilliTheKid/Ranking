require 'spec_helper'

describe Member do
  
  before(:each) do
    @attr = { :first_name             => "example",
              :last_name              => "member",
              :email                  => "member@example.com",
              :date_of_birth          => Date.today,
              :password               => "000000",
              :password_confirmation  => "000000" 
            }
  end
  
  it "should create a new member given valid attributes" do
    Member.create!(@attr)
  end
  
  describe "first_name" do
    it "should require a first name" do
      no_first_name_member = Member.new(@attr.merge(:first_name => ""))
      no_first_name_member.should_not be_valid
    end
  
    it"should not accept a first_name that is too long" do
      long_first_name = "a" * 51
      long_first_name_member = Member.new(@attr.merge(:first_name => long_first_name))
      long_first_name_member.should_not be_valid
    end
  end
  
  describe "last_name"do
    it "should require a last_name" do
      no_last_name_member = Member.new(@attr.merge(:last_name => ""))
      no_last_name_member.should_not be_valid
    end

    it"should not accept a last_name that is too long" do
      long_last_name = "a" * 51
      long_last_name_member = Member.new(@attr.merge(:last_name => long_last_name))
      long_last_name_member.should_not be_valid
    end  
  end
  
  describe "email" do
    it "should accept a valid email address" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_member = Member.new(@attr.merge(:email => address))
        valid_email_member.should be_valid
      end
    end
    
    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invailid_eamil_member = Member.new(@attr.merge(:email => address))
        invailid_eamil_member.should_not be_valid  
      end
    end
    
    it "should reject a duplicate email address" do
      #put a member with a given email address into the database
      upcased_email = @attr[:email].upcase
      Member.create!(@attr)
      member_with_duplicate_email = Member.new(@attr)
      member_with_duplicate_email.should_not be_valid
    end
    
    it "should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      Member.create!(@attr.merge(:email => upcased_email))
      member_with_duplicate_email = Member.new(@attr)
      member_with_duplicate_email.should_not be_valid
    end
  end
  
 

end

