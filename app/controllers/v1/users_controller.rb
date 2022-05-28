module V1
  class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        render json: UserSerializer.new(@user).serialized_json, status: :created
      else
        render json: {error: "Invalid username or password"}, status: :unprocessable_entity
      end
    end

    # LOGGING IN
    def login
      @user = User.find_by(email: auth_params[:email])

      if @user && @user.authenticate(auth_params[:password])
        render json: UserSerializer.new(@user).serialized_json, status: :ok
      else
        render json: {error: "Invalid username or password"}, status: :unauthorized
      end
    end


    def auto_login
      render json: @user
    end

    private

    def auth_params
      params.require(:auth).permit(:email, :password)
    end

    def user_params
      params.permit(:first_name, :last_name, :email, :password, :country)
    end
  end
end
