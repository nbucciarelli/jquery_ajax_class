class AddressesController < ApplicationController
  respond_to :html, :json

  before_filter :find_address, :only => [:show, :edit, :update, :destroy]

  def index
    if params[:q] && !params[:q].blank?
      @addresses = Address.search(params[:q])
    else
      @addresses = Address.all(:limit => 1000)
    end
    respond_with @addresses
  end

  def show
    respond_with @address
  end

  def new
    @address = Address.new
    respond_with @address
  end

  def create
    @address = Address.create(params[:address])
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
