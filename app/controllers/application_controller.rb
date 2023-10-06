class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || artists_root_path
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || artists_root_path
  end
end
