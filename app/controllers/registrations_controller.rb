class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def create
		build_resource(sign_up_params)

		resource.email = sign_up_params[:email]
		resource.password = sign_up_params[:password]
		resource.password_confirmation = sign_up_params[:password_confirmation]
    resource.username = sign_up_params[:username]
    resource.first_name = sign_up_params[:first_name]
    resource.last_name = sign_up_params[:last_name]
    resource.level = 0
    resource.points = 0

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
	end

	def update
		super
	end
end
