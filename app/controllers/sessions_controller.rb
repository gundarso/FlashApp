class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(customer)
    if customer_signed_in? && customer.sign_in_count == 1
      edit_customer_path(resource), notice: "Please fill in your profile"
    else
      root_path
    end
  end

  def after_sign_in_path_for(shop)
    if shop_signed_in? && shop.sign_in_count == 1
      edit_shop_path(resource), notice: "Please fill in your profile"
    else
      root_path
    end
  end


end
