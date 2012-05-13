class EventsController < ApplicationController

  #before_filter :authenticate_user!, :except => [:index]

  def index
    @events = Event.find :all
  end

  def create
    # set event
    @event = Event.new(:name => params[:event][:name])

    # check and add user
    tmp_user = User.find_by_email(params[:event][:user][:email])
    if tmp_user
      @event.user << tmp_user
    else 
      flash[:message] = "User "+params[:event][:user][:email]+" not found!"
    end

    time =  DateTime.new(params[:event][:place]["time(1i)"].to_i, params[:event][:place]["time(2i)"].to_i, params[:event][:place]["time(3i)"].to_i, params[:event][:place]["time(4i)"].to_i, params[:event][:place]["time(5i)"].to_i)
    # New Place
    @event.place << Place.create(:name => params[:event][:place][:name], :time => time.to_s)

    # New Dinner
    @event.dinner << Dinner.create(:name => params[:event][:dinner][:name])
    if @event.save
      redirect_to :action => :show, :id => @event.id
    else
      render :action => 'new'
    end
  end

  def add_user
    unless params[:event].nil?
      # get event
      event = Event.find params[:id]
      # check and add user
      tmp_user = User.find_by_email(params[:event][:user][:email])
      if tmp_user
        event.user << tmp_user
        event.save
      else 
        flash[:message] = "User "+params[:event][:user][:email]+" not found!"
      end
      redirect_to :action => :show, :id => params[:id]
    end
  end

  def add_dinner
    unless params[:event].nil?
      # get event
      event = Event.find params[:id]

      event.dinner << Dinner.create(:name => params[:event][:dinner][:name])
      event.save

      redirect_to :action => :show, :id => params[:id]
    end
  end

  def add_place
    unless params[:event].nil?
      # get event
      event = Event.find params[:id]

      time =  DateTime.new(params[:event][:place]["time(1i)"].to_i, params[:event][:place]["time(2i)"].to_i, params[:event][:place]["time(3i)"].to_i, params[:event][:place]["time(4i)"].to_i, params[:event][:place]["time(5i)"].to_i)
    # New Place
      event.place << Place.create(:name => params[:event][:place][:name], :time => time.to_s)

      redirect_to :action => :show, :id => params[:id]
    end
  end  

  def new
    @event = Event.new
  end

  def show
    if params[:id]
      @event = Event.find params[:id]
      @users = User.includes(:event).where('events.id = '+params[:id])
      @places = Place.includes(:event).where('events.id = '+params[:id])
      @dinners = Dinner.includes(:event).where('events.id = '+params[:id])
    elsif
      redirect_to :action => :index
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    if @event.update_attributes(params[:event])
      flash[:notice] = 'Event saved!'
      redirect_to :action => :show, :id => @event.id
    else
      flash[:notice] = 'Event could not be saved!'
      redirect_to :action => :index
    end
  end
end
