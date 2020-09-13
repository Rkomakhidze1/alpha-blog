class UsersController < ApplicationController
    def index
        users = User.all
        render json: {data: users}, status: :ok
    end

    def create
        user = User.new(email: params[:email], username: params[:username], password:[params[:password]])
        if user.save
            render json: {data: user}, status: :ok
        else
            render json: {errors: user.errors.full_messages}, status: :bad_request
        end
    end
end
