module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      reject_unauthorized_connection unless current_user
    end

    private

    def find_verified_user
      if cookies.signed[:user_id]
        User.find_by(id: cookies.signed[:user_id]) || reject_unauthorized_connection
      else
        reject_unauthorized_connection
      end
    end
  end
end
