class EventsController < ApplicationController

  #before_filter :authenticate_user!, :except => [:index]

  def index
    @events = Event.find :all
  end

  def create
    # save event
    @event = Event.new :name => params[:name]
    if @event.save
      # save users
      params[:users].split(',').each do |user_mail|
        tmp_user = User.where(:email => user_mail).first
        if tmp_user
          EventUser.create :user_id => tmp_user.id, :event_id => @event.id
        end
      end
      # save place
      params[:places].split(',').each do |place|
        Place.create :event_id => @event.id, :name => place, :time => Time.now
      end
      # save dinners
      params[:dinners].split(',').each do |dinner|
        Dinner.create :event_id => @event.id, :name => dinner
      end
      redirect_to :action => :show, :id => @event.id
    else
      render :action => 'new'
    end
  end

  def new
    @event = Event.new
  end

  def show
    if params[:id]
      @event = Event.find params[:id]
      @users = User.includes(:Event).where('events.id = '+params[:id])
      @places = Place.includes(:Event).where('events.id = '+params[:id])
      @dinners = Dinner.includes(:Event).where('events.id = '+params[:id])
    elsif
      redirect_to :action => :index
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    debugger
    if @event.update_attributes(params[:event])
      flash[:notice] = 'Event saved!'
      redirect_to :action => :show, :id => @vent.id
    else
      flash[:notice] = 'Event could not be saved!'
      redirect_to :action => :index
    end
  end
end
