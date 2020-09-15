class UsersController < ApplicationController
    before_action :authorized, only: [:destroy]

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

    def destroy
        @user.destroy
        render json: {success: true}, status: :ok
    end

    private

    def user_params
        params.permit(:email, :password, :username)
    end
end
