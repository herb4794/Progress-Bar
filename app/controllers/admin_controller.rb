class AdminController < ApplicationController
    def log_in
    end

    def log_out
        session[:current_user] = nil
        redirect_to root_path
    end

    def create_session

        user = User.find_by(email: params[:email], password: encrypted(params[:password]) )

        if user
            session[:current_user_id] = user.id
            flash[:notice] = "登入成功"
            redirect_to root_path
            return
        end

        flash[:notice] = "登入失敗"
        redirect_to action: :log_in
        return
    end

    def encrypted(password)
        return "herb" + password    
    end
end