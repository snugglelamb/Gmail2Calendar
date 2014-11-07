class QuotesController < ApplicationController
  before_filter :set_quote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @quotes = Quote.all
    respond_with(@quotes)
  end

  def show
    respond_with(@quote)
  end

  def new
    @quote = Quote.new
    respond_with(@quote)
  end

  def edit
  end

  def create
    @quote = Quote.new(params[:quote])
    @quote.save
    respond_with(@quote)
  end

  def update
    @quote.update_attributes(params[:quote])
    respond_with(@quote)
  end

  def destroy
    @quote.destroy
    respond_with(@quote)
  end

  private
    def set_quote
      @quote = Quote.find(params[:id])
    end
end
