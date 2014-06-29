module AuthenticationHelper
  # Public: Set user in session.
  # Uses https://github.com/railsware/rack_session_access
  #
  # user - Persisted User instance.
  #
  # Returns an Integer.
  def sign_in(user)
    if respond_to?(:session)
      session[:user_id] = user.id
    end
    page.set_rack_session(:user_id => user.id)
  end
end
