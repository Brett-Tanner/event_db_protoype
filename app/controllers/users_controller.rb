class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    render "show_#{current_user.role}"
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome #{@user.name}, you've signed up"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Could not create user"
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "#{@user.name} updated successfully"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Could not update user"
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    
    if @user.destroy
      flash[:notice] = "Successfully removed user"
      redirect_to root_path
    else
      flash.now[:alert] = "Could not delete user"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
