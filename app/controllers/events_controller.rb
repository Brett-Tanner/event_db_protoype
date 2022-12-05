class EventsController < ApplicationController
  def index
    @events = Event.all.order(:start_date)
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "You've created #{@event.name} for #{event.school}"
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "Could not create event"
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = "#{@event.name} updated successfully"
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "Could not update event"
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    
    if @event.destroy
      flash[:notice] = "Successfully removed event"
      redirect_to root_path
    else
      flash.now[:alert] = "Could not delete event"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
