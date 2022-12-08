class ChildrenController < ApplicationController
  def index
    @children = Child.all
  end
  
  def show
    @child = Child.find(params[:id])
  end
  
  def new
    @child = Child.new(user_id: params[:user])
  end
  
  def create
    @child = Child.new(child_params)

    if @child.save
      flash[:notice] = "You have added #{@child.name} as a child of #{@child.user.name}"

      @child.school.events.each do |event|
        event.event_days.each do |ed|
          ed.registrations.create(event_day_id: ed.id, child_id: @child.id, attend_morning: false, attend_afternoon: false)
        end
      end
      
      redirect_to user_path(@child.user)
    else
      flash.now[:alert] = "Could not create child"
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @child = Child.find(params[:id])
  end
  
  def update
    @child = Child.find(params[:id])

    if @child.update(child_params)
      flash[:notice] = "#{@child.name} updated successfully"
      redirect_to child_path(@child)
    else
      flash.now[:alert] = "Could not update child"
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @child = Child.find(params[:id])
    
    if @child.destroy
      flash[:notice] = "Successfully removed child"
      redirect_to root_path
    else
      flash.now[:alert] = "Could not delete child"
    end
  end

  private

  def child_params
    params.require(:child).permit(:id, :name, :birthday, :level, :allergies, :user_id, registrations_attributes: [:id, :child_id, :event_day_id, :attend_morning, :attend_afternoon])
  end
end
