class MygmailsController < ApplicationController

  before_action :set_user #, only: [:show, :edit, :update, :destroy, :]

  respond_to :html
  
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
