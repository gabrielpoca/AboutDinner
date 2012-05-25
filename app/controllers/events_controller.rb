class EventsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

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
      flash[:notice] = "User "+params[:event][:user][:email]+" not found!"
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

      # find event
      event = Event.find params[:id]

      # find user by email
      tmp_user = User.find_by_email(params[:event][:user][:email])

      unless tmp_user.nil?
        # if user exists add it
        event.user << tmp_user
        event.save
        flash[:notice] = params[:event][:user][:email]+" added"
      else 
        # if user does not exist invite and add
        password = Devise.friendly_token.first(6)
        event.user << User.create!(:email => params[:event][:user][:email], :password => password, :password_confirmation => password)
        flash[:notice] = params[:event][:user][:email]+" invited"
      end

      redirect_to :action => :show, :id => params[:id]

    end
  end

  def remove_user
    unless params[:event_id].nil?
      user = User.find params[:user_id]
      event = Event.find params[:event_id]
      event.user.delete user
      flash[:notice] = "User removed"
      redirect_to :action => :show, :id => params[:event_id]
    else
      flash[:notice] = "Error removing user"
      redirect_to :action => :index
    end
  end

  def remove_place
    unless params[:event_id].nil?
      event = Event.find params[:event_id]
      place = Place.find params[:place_id]
      event.place.delete place
      flash[:notice] = "Place removed"
      redirect_to :action => :show, :id => params[:event_id]
    else
      flash[:notice] = "Error removing place"
      redirect_to :action => :index
    end
  end

  def remove_dinner
    unless params[:event_id].nil?
      event = Event.find params[:event_id]
      dinner = Dinner.find params[:dinner_id]
      event.dinner.delete dinner
      flash[:notice] = "Dinner removed"
      redirect_to :action => :show, :id => params[:event_id]
    else
      flash[:notice] = "Error removing dinner"
      redirect_to :action => :index
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

  def add_comment
    unless params[:event].nil?
      # get event
      event = Event.find params[:id]

      event.comment << Comment.create(:content => params[:event][:comment][:content], :time => Time.now)
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
      @event = Event.find(params[:id])
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
