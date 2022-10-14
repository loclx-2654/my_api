# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authorized

  def encode_token payload
    JWT.encode(payload, 'my_s3cr3t')
  end

  def authentication_header
    request.headers['Authorization']
  end

  def decoded_token
    return unless authentication_header

    token = authentication_header.split(' ')[1]

    JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
  end

  def logged_in_user
    return unless decoded_token

    @user = User.find_by_id(decoded_token[0]["user_id"])
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
