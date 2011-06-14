require 'spec_helper'

describe MembersController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @member = Factory(:member)
    end
    
    it "should be successful" do
      get :show, id => @member
      response.should be_success
    end
    
    it "should be the right user" do
      get :show, :id => @member
      assigns(:member).should == @member
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Sign Up")
    end  
  end

end
