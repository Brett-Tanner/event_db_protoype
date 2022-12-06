class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new(event_day_id: params[:event_day], child_id: params[:child])
  end
  
  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      flash[:notice] = "You've registered #{@registration.child.name} for #{@registration.event_day.event.title} at #{@registration.event_day.event.school.name}"
      redirect_to event_path(@registration.event_day.event)
    else
      flash.now[:alert] = "Could not create registration"
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @registration = Registration.find(params[:id])
  end
  
  def update
    @registration = Registration.find(params[:id])

    if @registration.update(registration_params)
      flash[:notice] = "Registration updated successfully"
      redirect_to event_path(@registration.event_day.event)
    else
      flash.now[:alert] = "Could not update registration"
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @registration = Registration.find(params[:id])
    
    if @registration.destroy
      flash[:notice] = "Successfully removed registration"
      redirect_to root_path
    else
      flash.now[:alert] = "Could not delete registration"
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:child_id, :event_day_id, :attend_morning, :attend_afternoon)
  end
end
