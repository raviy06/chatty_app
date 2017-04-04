module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user

   def connect
     self.current_user = User.find_by(token: session[:token])
     logger.add_tags 'ActionCable', current_user.name
   end
  end
end
