module AuthenticationBlock
    class  UsersController < ApplicationController
        def index
            user = AuthenticationBlock::User.all 
            render json: user
        end
     
        def show
            user = AuthenticationBlock::User.find(params[:id])
            render json: user
        end

        def create
            user = AuthenticationBlock::User.new(user_params)
            token = encode_token(user_id: user.id)
            if user.save
                render json: {user: user, token: token}
            else
                render json: {errors: users.errors.full_messages}
            end
        end

        def destroy
            user = AuthenticationBlock::User.find(params[:id])
            user.destroy
        end

        def login
            @user = AuthenticationBlock::User.find_by(email: user_params[:email])
            if @user && @user.authenticate(user_params[:password])
                token = encode_token({user_id: @user.id})
                render json: {user: @user,token: token},status: :ok
            else
                render json: {error: 'invalid'},status: :unprocessable_entity 
            end 
        end

        private
        def user_params
            params.permit(:username, :email, :password)
        end
     
    end
  end