class ApplicationController < ActionController::Base
  before_action :set_signed_user_cookie

  private

  def set_signed_user_cookie
    if current_user
      cookies.signed[:user_id] = { value: current_user.id, expires: 1.hour.from_now }
    end
  end
end
