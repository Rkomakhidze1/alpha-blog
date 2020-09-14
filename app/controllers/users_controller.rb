class UsersController < ApplicationController
    def index
        users = User.paginate(page: params[:page], per_page: 3)
        render json: {data: users}, status: :ok
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: {data: user}, status: :ok
        else
            render json: {errors: user.errors.full_messages}, status: :bad_request
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password_digest, :username)
    end
end
