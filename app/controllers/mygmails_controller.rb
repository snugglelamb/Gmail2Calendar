require 'gmail'
require 'date'
require 'google/api_client'
require_relative 'events_controller'
class MygmailsController < ApplicationController

  before_action :set_user , except: [:addevent ]

  respond_to :html
  def getGmails 
    
    start = DateTime.parse(params[:q])
    Gmail.connect(@user.email, @user.psw) do |gmail|
      break unless gmail.logged_in?
      gmail.inbox.emails(:after => start ).each do |email|
        if Mygmail.where(:eid => email.uid, :user_id =>@user.id).empty?
          event_name = email.subject
          text = email.text_part.body.to_s 
          event_schedule = parsetime text
          @mygmail =  @user.mygmails.create(:eid => email.uid, :user_id => @user.id, :content =>text)
          @mygmail.save
          @event = @mygmail.events.create(:mygmail_id => @mygmail.id, :schedule => event_schedule, :name=> event_name)
          @event.save
        end
      end
    end
    addevent
    @mygmail = @user.mygmails.all
    render :template => "mygmails/index"
  end
  
  def addevent
    @mygmail = @user.mygmails.all
    client = Google::APIClient.new
    client.authorization.access_token = @user.token
    service = client.discovered_api('calendar', 'v3')
    @mygmail.each do |g|
      g.events.all.each do |e|
        _tocal = {
        'summary' => e.name,
        'location' => e.location,
        'start' => e.schedule}
        
        @set_event = client.execute(
                                :api_method => service.events.insert,
                                :parameters => {'calendarId' => @user.email, 'sendNotifications' => true},
                                :body => JSON.dump(_tocal),
                                :headers => {'Content-Type' => 'application/json'})
                            
      end
    end
  end
  
  def parsetime text
      text.lines.each do |l| 
        # 2014-11-20
        if m = /\d{2,4}-\d{1,2}-\d{1,2}/.match(l)
          date = DateTime.parse(m[0])
          return date
        end
        #2014/11/20
        if m = /\d{2,4}\/\d{1,2}\/\d{1,2}/.match(l)
          date = DateTime.parse(m[0])
          return date
        end
        
        #11/20
        if m = /\d{2,4}\/\d{1,2}\/\d{1,2}/.match(l)
          date = DateTime.parse(m[0])
          return date
        end
        
    end
  end
  
  def index
   
    @mygmail = @user.mygmails.all
    respond_with(@user, @mygmail)
  end

  def show
    @mygmail = @user.mygmails.find(params[:id])
    respond_with(@user, @mygmail)
  end

  def new
    @mygmail = @user.mygmails.build
    
    respond_with(@user, @mygmail)
  end

  def edit
    @mygmail = @user.mygmails.find(params[:id])
    respond_with(@user, @mygmail)
  end

  def create
   
    @mygmail = @user.mygmails.create(mygmail_params)
    
    if @mygmail.save
      respond_with(@user,@mygmail)
    else
      
    end
  end

  def update
    
    @mygmail = @user.mygmails.find(params[:id])
    @mygmail.update(mygmail_params)
    respond_with(@user, @mygmail)
  end

  def destroy
    
    @mygmail = @user.mygmails.find(params[:id])
    @mygmail.destroy
    respond_with(@user, @mygmail)
  end

  private
    def set_user
      @user = User.find(params[:user_id])
     
    end

    def mygmail_params
      params.require(:mygmail).permit(:eid)
    end
end
