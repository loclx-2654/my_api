# frozen_string_literal: true

class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval File.read(Rails.root.join("config/routes/#{routes_name}.rb"))
  end
end

Rails.application.routes.draw do
  require_relative 'routes/api'
  devise_for :users
  draw :api
end
