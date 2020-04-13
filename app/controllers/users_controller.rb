class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]

  def show
    # @articles = @user.articles
    @pagy, @articles = pagy(@user.articles, items: 5)
  end

  def index
    @pagy, @users = pagy(User.all, items: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the alpha  #{@user.username}, you have succesfully signed up."
      redirect_to login_path
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was succesfully updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end



end
