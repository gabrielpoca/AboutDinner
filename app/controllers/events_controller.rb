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
        user = User.where(:email => user_mail)
        if user
          EventsUsers.create :user_id => user.id, :event_id => @event.id
        end
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
    @event = Event.find params[:id]
    @users = Event.find(params[:id]).User
  end

  def edit
  end
end
