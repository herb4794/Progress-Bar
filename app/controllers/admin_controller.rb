class AdminController < ApplicationController
    before_action :redirect_to_root_if_log_in, except: [:log_out]
    before_action :redirect_to_root_if_not_log_in, only: [:log_out]


    def log_in
    end

    def log_out
            session[:current_user_id] = nil
            flash[:notice] = "登出成功"
            redirect_to root_path
            return
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

    def redirect_to_root_if_log_in
        if current_user
            flash[:notice] = "已經登入"
            redirect_to root_path
            return
        end
    end

    def redirect_to_root_if_not_log_in
        if !current_user
            flash[:notice] = "你尚未登入"
            redirect_to root_path
            return
        end
    end

    def encrypted(password)
        return "herb" + password    
    end
end