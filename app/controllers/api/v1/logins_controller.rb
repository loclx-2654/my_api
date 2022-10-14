# frozen_string_literal: true

class Api::V1::LoginsController < ApplicationController
  def login
    user = User.find_for_database_authentication(email: user_params[:email])
    raise Errors::Runtime::ActionFailed, :invalid unless user&.valid_password?(user_params[:password])

    token = user.generate_token

    render json: {
      success: true,
      data: {
        token: token
      }
    }, status: 200
  end
end
