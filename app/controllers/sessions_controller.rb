class SessionsController < ApplicationController
    before_action :authorized, only: [:me, :destroy]

    def create
        user = User.find_by(email: params[:email])

        return render json: {success: false}, status: :unauthorized if !user

        if user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            user.tokens.push(token)
            user.save
            render json: {user: user, token: token}
        else 
            render json: {success: false}, status: :unauthorized
        end
    end

    def destroy
        token = auth_header.split(' ')[1]
        @user.tokens = @user.tokens.select do |t| 
            t != token
        end
        if @user.save
            render json: {data: "you are logged out"}
        end

    end

    def me
        render json: {user: @user}
    end

end