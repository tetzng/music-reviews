# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :auth_spotify
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || mypage_root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[name email password password_confirmation avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  private

  def auth_spotify
    require 'rspotify'
    RSpotify.authenticate(Rails.application.credentials.spotify[:client_id], Rails.application.credentials.spotify[:client_secret])
  end

  def store_current_location
    store_location_for(:user, request.url)
  end
end
