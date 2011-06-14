module SessionsHelper
  
  def sign_in(member)
    cookies.permanent.signed[:remember_token] = [member.id, member.salt]
    current_member = member
  end
  
  def sign_out
    cookie.delete(:remember_token)
    current_member = nil
  end
  
  def current_member=(member)
    @current_member = member
  end

  def current_member
    @current_member ||= member_from_remember_token
  end
  
  def signed_in?
    !current_member.nil?
  end
  
  private
    
    def member_from_remember_token
      Member.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
    
end