class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Your event was created"
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, notice: "Your event was updated"
    else
      render :edit
    end

  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

  def join(event)
    if event.attendees.none? {|user| user.email == current_user.email}
      event.attendees << current_user
    end

  end


end
