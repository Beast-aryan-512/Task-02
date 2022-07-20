class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render to 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @post = User.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to root_path, notice: "User deleted."
    end
  end


  private
  def user_params
    # debugger
    params.require(:user).permit(:id, :email, :address, :name, :image, :unique_id, :password, :password_confirmation)
  end

  def set_user
    @user = User.with_attached_image.find(params[:id])
  end
end