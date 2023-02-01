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

  def attend
    @event = Event.find(params[:id])

    if @event.attendees.none? {|user| user.email == current_user.email}
      @event.add_attendee(current_user)
      redirect_to event_path(@event)
    end

  end

  def past

  end

  def future

  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :date)
  end




end
