class AddressesController < ApplicationController
  respond_to :html, :json, :jsonp

  before_filter :find_address, :only => [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all(:limit => 100)
    respond_with @addresses
    # p @addresses
   # @addresses.map { |address| {first_name: "#{address.first_name}", last_name: "#{address.last_name}", address: "#{address.address}", city: "#{address.city}" }}
    # respond_to do |format|
    #   format.json {
    #     render json: {}
    #   }
    # end
  end

  def show
    respond_with @address
  end

  def new
    @address = Address.new
    respond_with @address
  end

  def create
    @address = Address.new(params[:address])
    @address.save
    respond_with @address
  end

  def edit
    respond_with @address
  end

  def update
    @address.update_attributes(params[:address])
    respond_with @address
  end

  def destroy
    @address.delete
    respond_with @address
  end

private
  def find_address
    @address = Address.find(params[:id])
  end
end
