class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    resource.class == Shop ? edit_shop_path(resource) : edit_customer_path(resource)
  end
end
