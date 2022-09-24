# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def create
    user = User.create! user_params

    render json: {
      success: true,
      data: {
        id: user.id,
        message: I18n.t('api.v1.users.created')
      }
    }
  end

  private

  def user_params
    params[:user].permit(:user_name, :email, :password, :password_confirmation)
  end
end
