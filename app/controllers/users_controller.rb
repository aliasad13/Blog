class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
   before_action :require_user?, only:  [:edit,:update,:destroy]
  before_action :require_same_user, only: [:edit,:update,:destroy]


  def  show

    # @user = User.find(params[:id])
    @blogs = @user.blogs.paginate(page: params[:page], per_page: 5).order("created_at DESC")

  end

  def index
    @users =  User.paginate(page: params[:page], per_page: 5).order("created_at DESC")
  end

def new

@user =  User.new #just initiating a new user instance variable

end


def create
  @user = User.new(user_params)
# user = User.new(username:'joey',email:'joey@gmail.com',password:'11223344')
# once the user is created we need to sign them in as well becs even after signing up the sign in
# link is showing which means signing in is not signing up,so we need the code to sign the user in




if @user.save #if no errors
  session[:user_id] = @user.id
flash[:notice] = "welcome to Foradian Blog #{@user.username} "
  redirect_to blogs_path #wher we should go after sign up

else
  render 'new'

end

end




def edit
#
# @user = User.find(params[:id])

  #user = User,find(1) => user wit id 1
end

def update

  # @user = User.find(params[:id])

if @user.update(user_params)
flash[:notice] = "your account info has been updated successfully"
redirect_to user_path

else
  render 'edit'


end

end

  def destroy

    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated articles deleted"
    redirect_to root_path
  end


  private

  def user_params

params.require(:user).permit(:username, :email, :password)
  end

  def set_user

    @user = User.find(params[:id])
  end

  def require_same_user

    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only delete or edit your own Article/Account"
      redirect_to @user
    end
  end


end