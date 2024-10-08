class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params.except(:current_password))
    else
      super
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :location, { hobby_ids: [] }, :new_hobbies ])
  end
end
