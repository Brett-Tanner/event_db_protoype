class UsersController < ApplicationController
  # after_save :register_all_events

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
    unless current_user.role == "admin"
      params[:role] = "caregiver"
    end

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
    params.require(:user).permit(:id, :role, :name, :phone, :email, :password, :password_confirmation, :school_id, children_attributes: [:id, :user_id, :name, :birthday, :level, :category, :allergies])
  end

  # def register_all_events
  #   self.school.events.each do |event|
  #     event.event_days.each do |ed|
  #       ed.registrations.create(event_day_id: ed.id, child_id: @child.id, attend_morning: false, attend_afternoon: false)
  #     end
  #   end
  # end
end
