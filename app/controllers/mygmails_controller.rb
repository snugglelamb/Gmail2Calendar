require 'gmail'
require 'date'
require 'google/api_client'
require_relative 'events_controller'
require 'active_support/time'
class MygmailsController < ApplicationController

  before_action :set_user , except: [:addevent ]

  respond_to :html
  def getGmails 
    
    start = DateTime.parse(params[:q])
    Gmail.connect(@user.email, @user.psw) do |gmail|
      break unless gmail.logged_in?
      gmail.inbox.emails(:after => start ).each do |email|
        flag = false
        if Mygmail.where(:eid => email.uid, :user_id =>@user.id).empty?
          flag = true
          event_name = email.subject
          if email.text_part.nil?
            text = email.body.to_s
          else
            text = email.text_part.body.to_s 
          end
          # parser method needed here
          event_schedule = parsetime text
          @mygmail =  @user.mygmails.create(:eid => email.uid, :user_id => @user.id, :content =>text)
          @mygmail.save
          # if no event_schedule then event is not added
          @event = @mygmail.events.create(:mygmail_id => @mygmail.id, :schedule => event_schedule, :name=> event_name) unless event_schedule.nil? 
          @event.save
        end
        # addevent if flag
        addevent @user if flag
      end
    end
    
    @mygmail = @user.mygmails.all
    render :template => "mygmails/index"
  end
  
  # add event to google calendar
  def addevent user
    @mygmail = user.mygmails.all

    client = Google::APIClient.new
    client.authorization.access_token = user.token
    service = client.discovered_api('calendar', 'v3')
    @mygmail.each do |g|
      g.events.all.each do |e|
        unless e.schedule.nil?
          _tocal = {
            'summary' => e.name,
              'description' => e.name,
              'location' => e.location,
              'start' => {
                  'dateTime' => e.schedule.to_datetime.rfc3339},
              'end' => {
                  'dateTime' => ((e.schedule.to_datetime + 2.0/24).rfc3339)},
              'attendees' => { "email" => user.email }
        }
        
          @set_event = client.execute(
                                  :api_method => service.events.insert,
                                  :parameters => {'calendarId' => user.email, 'sendNotifications' => true},
                                  :body => JSON.dump(_tocal),
                                  :headers => {'Content-Type' => 'application/json'})
                                
          p "Event Added Suceessfully."
        end                
      end
    end
  end
  
  def parsetime text
    zone = "Eastern Time (US & Canada)"
      text.lines.each do |l| 
        # 2014-11-20
        if m = /\d{2,4}-\d{1,2}-\d{1,2}/.match(l)
          date = ActiveSupport::TimeZone[zone].parse(m[0])
          return date
        end
        #2014/11/20
        if m = /\d{4}\/\d{1,2}\/\d{1,2}/.match(l)
          date = ActiveSupport::TimeZone[zone].parse(m[0])
          return date
        end
        
        #/11/20/2014
        if m = /(\d{1,2}\/\d{1,2})\/(\d{4})/.match(l)
          temp = m[2]+'/'+m[1]
          # date = DateTime.strptime(m[0],'%m/%d/%Y').in_time_zone("EST")
          date = ActiveSupport::TimeZone[zone].parse(temp)
          return date
        end
        
        # #11/20
        # if m = /\d{2,4}\/\d{1,2}\/\d{1,2}/.match(l)
        #   date = ActiveSupport::TimeZone[zone].parse(m[0])
        #   return date
        # end
        
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
  
  def sort
    # @mygmails = []
    # if (Mygmail.attribute_names.include? (params[:field])) then
    @mygmail = Mygmail.order(:eid)
    # end
    render :index
  end

  private
    def set_user
      @user = User.find(params[:user_id])
     
    end

    def mygmail_params
      params.require(:mygmail).permit(:eid)
    end
end
