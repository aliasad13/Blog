class ApplicationController < ActionController::Base



  def current_user

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #if the user_id exists in the session,i.e if te user is signed in
    # then find the user by that user_id

    # @current_user ||= means that if we already checked current user in the table,
    # then next time when we referencecurrent user, we have it saved in @current_user
    # we dont have to go and check the table again

    # but if we havent checked,then it will automatically check in the table
  end

  def user_signed_in?
#
#  here we have to check if ther user is signed in,we will do that by checking
# if current user exists .This can simply be done by turning he above @current_user
# into a boolean and this is done by

    !!current_user


  end

  def require_user?

    if !user_signed_in?

      flash[:alert] = "unauthorized user"
      redirect_to login_path

    end
  end
end
