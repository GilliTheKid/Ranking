class SessionsController < ApplicationController
  
  def new
    @title = "Sign in"
  end
  
  def create
    member = Member.authenticate(:params[:session][:email],
                                 :params[:session][:password])
    if member.nil?
    
    else
      
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end