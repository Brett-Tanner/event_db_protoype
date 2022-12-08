class EventsController < ApplicationController
  def index
    @events = Event.all.order(:start_date)
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    fee = params[:fee]

    num_days = (end_date - start_date).to_i + 1

    if current_user.role != "admin"
      render "errors/permission"
    else
      @event = Event.new(start_date: start_date, end_date: end_date)
      num_days.times do |i|
        @event.event_days << EventDay.new(date: start_date + i.days, fee: fee)
      end
    end
  end
  
  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "You've created #{@event.title} for #{@event.school.name}"

      kids = @event.school.children
      event_days = @event.event_days

      event_days.each do |event_day|
        kids.each do |kid|
          event_day.registrations.create(child_id: kid.id, attend_morning: false, attend_afternoon: false)
        end
      end

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
    params.require(:event).permit(:id, :school_id, :title, :description, :start_date, :end_date, event_days_attributes: [:id, :date, :fee, :morning_description, :afternoon_description])
  end
end
