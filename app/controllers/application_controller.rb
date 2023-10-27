class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || sign_in_path_for(resource)
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || sign_out_path_for(resource)
  end

  private

  def sign_in_path_for(resource)
    if resource.is_a?(Artist)
      artists_root_path
    elsif resource.is_a?(Listener)
      listeners_root_path
    else
      artists_root_path
    end
  end

  def sign_out_path_for(resource)
    if resource == :artist
      artists_root_path
    elsif resource == :listener
      listeners_root_path
    else
      artists_root_path
    end
  end
end
