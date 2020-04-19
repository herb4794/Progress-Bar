class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception 
    before_action :current_user

    def current_user
        if @current_user
            return @current_user
        end


    current_user_id = session[:current_user_id]
    if current_user_id
        @current_user = User.find_by_id(current_user_id)
    end
end
    

end
