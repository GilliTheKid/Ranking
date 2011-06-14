class MembersController < ApplicationController
  def new
    @title = "Sign Up"
    @member = Member.new
  end

end
