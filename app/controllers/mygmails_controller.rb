class MygmailsController < ApplicationController
  attr_accessor :user
  before_action :set_mygmail_user, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  def index
    # if (params[:user_id]) then
#       @mygmail = Mygmail.where('user_id = ?',params[:user_id])
#     else
#       #@mygmails = Mygmail.all
#     end
    @user = User.find(params[:user_id])
    @mygmails = @user.mygmails.all
    respond_with(@user, @mygmail)
  end

  def show
    @user = User.find(params[:user_id])
    @mygmail = @user.mygmails.find(params[:id])
    respond_with(@user, @mygmail)
  end

  def new
    @user = User.find(params[:user_id])
    @mygmail = @user.mygmails.build
    
    respond_with(@user, @mygmail)
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @mygmail = @user.mygmails.create(mygmail_params)
    #Mygmail.new(mygmail_params)
    if @mygmail.save
      respond_with(@user,@mygmail)
    else
      
    end
  end

  def update
    @user = User.find(params[:user_id])
    @mygmail = @user.mygmails.find(params[:id])
    @mygmail.update(mygmail_params)
    respond_with(@user, @mygmail)
  end

  def destroy
    # @user = User.find(params[:user_id])
#     @mygmail = @user.mygmails.find(params[:id])
    @mygmail.destroy
    respond_with(@user, @mygmail)
  end

  private
    def set_mygmail_user
      @user = User.find(params[:user_id])
      @mygmail = @user.mygmails.find(params[:id])
      #@mygmail = Mygmail.find(params[:id])
    end

    def mygmail_params
      params.require(:mygmail).permit(:eid)
    end
end
