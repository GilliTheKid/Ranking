class MembersController < ApplicationController
  def new
    @title = "Sign Up"
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    
    if @member.save
      redirect_to @member
    else
      @title = "Sign Up"
      render :new
    end
  end
  
  def show
    @member = Member.find(params[:id])
  end
end
