class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    resource.class == Shop ? shop_path(resource) : customer_path(resource)
  end
end
