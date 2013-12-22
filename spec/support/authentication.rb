module ControllersSpecAuthenticationHelper
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

  RSpec.configure do |config|
    config.include(self)

    config.before(:each, :authenticated => true) do
      @_current_user = User.make!
      sign_in(@_current_user)
    end
  end
end
