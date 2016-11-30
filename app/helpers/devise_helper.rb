module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages

    flash[:notice] = messages
    return nil
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
