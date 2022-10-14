# frozen_string_literal: true

class Api::V1::LoginsController < ApplicationController
  before_action :authorized, only: :auto_login

  def login
    @user = User.find_by_user_name(login_params[:user_name])

    return response_auth_failed! if (!@user && !@user.authenticate(login_params[:password]))

    token = encode_token({user_id: @user.id})

    render json: {
      success: true,
      message: "Login success!",
      user: @user,
      token: token
    }
  end

  private

  def auto_login
    render json: @user
  end

  def response_auth_failed!
    render json: {
      success: false,
      error: "Invalid username or password"
    }
  end

  def login_params
    params[:user].permit(:user_name, :password)
  end
end
