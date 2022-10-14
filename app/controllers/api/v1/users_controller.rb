# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def create
    user = User.create! user_params

    if user.valid?
      token = encode_token(user_id: user.id)
      render json: {
               user: user,
               jwt: token,
             },
             status: :created
    else
      render json: {
               error: 'failed to create user',
             },
             status: :unprocessable_entity
    end
  end

  def show
    binding.pry
  end

  private

  def user_params
    params[:user].permit(:user_name, :email, :password, :password_confirmation)
  end
end
