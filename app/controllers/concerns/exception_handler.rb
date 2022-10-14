# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  end

  private

  def render_unprocessable_entity_response(error, status: :unprocessable_entity)
    @record = error.record

    render json: {
      success: false,
      errors: render_error
    }, status: 422
  end

  def render_error
    messages = @record.errors
    @record.errors.details.map do |field, details|
      @detail = details.first[:error]
      message = messages[field].first

      {
        resource: resource,
        field: field,
        code: code,
        message: message
      }
    end
  end

  def resource
    I18n.t underscored_resource_name,
           locale: :api,
           scope: %i[api errors resources],
           default: underscored_resource_name
  end

  def field
    I18n.t @field,
           scope: [:api, :errors, :fields, underscored_resource_name],
           default: @field.to_s
  end

  def code
    I18n.t @detail,
           locale: :api,
           scope: %i[api errors code],
           default: :default
  end

  def underscored_resource_name
    @record.class.to_s.gsub('::', '').underscore
  end
end
