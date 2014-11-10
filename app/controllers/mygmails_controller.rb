class MygmailsController < ApplicationController
  before_action :set_mygmail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @mygmails = Mygmail.all
    respond_with(@mygmails)
  end

  def show
    respond_with(@mygmail)
  end

  def new
    @mygmail = Mygmail.new
    respond_with(@mygmail)
  end

  def edit
  end

  def create
    @mygmail = Mygmail.new(mygmail_params)
    @mygmail.save
    respond_with(@mygmail)
  end

  def update
    @mygmail.update(mygmail_params)
    respond_with(@mygmail)
  end

  def destroy
    @mygmail.destroy
    respond_with(@mygmail)
  end

  private
    def set_mygmail
      @mygmail = Mygmail.find(params[:id])
    end

    def mygmail_params
      params.require(:mygmail).permit(:eid)
    end
end
