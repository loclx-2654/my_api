# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ExceptionHandler

  def encode_token payload
    JWT.encode(payload, 'my_s3cr3t')
  end

  def authentication_header
    request.headers['Authorization']
  end

  def decoded_token
  end
end
