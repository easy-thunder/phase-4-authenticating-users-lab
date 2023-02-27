class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def create
        user = User.find_by!(username: params[:username])
        if user
            session[:user_id]= user.id
            render json: user, status: :created
        end
    end




    def destroy
        session.delete :user_id
    end


private


def not_found (e)
render json: {error: e}, status: :not_found
end



end
