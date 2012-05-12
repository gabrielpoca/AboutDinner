class EventsController < ApplicationController

  #before_filter :authenticate_user!, :except => [:index]

  def index
    @events = Event.find :all
  end

  def create
    # save event
    @event = Event.new(:name => params[:event][:name])
    @event.user << User.find_by_email(params[:event][:user][:email])
    # Get Time
    time =  DateTime.new(params[:event][:place]["time(1i)"].to_i, params[:event][:place]["time(2i)"].to_i, params[:event][:place]["time(3i)"].to_i, params[:event][:place]["time(4i)"].to_i, params[:event][:place]["time(5i)"].to_i)
    # New Place
    @event.place << Place.create(:name => params[:event][:place][:name], :time => time.to_s)
    #@event.place << Place.create(:name => params[:event][:place][:name], :time => params[:event][:place][:time])
    if @event.save
      #      # save users
      #      params[:users].split(',').each do |user_mail|
      #        tmp_user = User.where(:email => user_mail).first
      #        if tmp_user
      #          EventUser.create :user_id => tmp_user.id, :event_id => @event.id
      #        end
      #      end
      #      # save place
      #      params[:places].split(',').each do |place|
      #        Place.create :event_id => @event.id, :name => place, :time => Time.now
      #      end
      #      # save dinners
      #      params[:dinners].split(',').each do |dinner|
      #        Dinner.create :event_id => @event.id, :name => dinner
      #      end
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
      redirect_to :action => :show, :id => @vent.id
    else
      flash[:notice] = 'Event could not be saved!'
      redirect_to :action => :index
    end
  end
end
