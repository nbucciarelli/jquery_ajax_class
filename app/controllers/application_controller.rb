class ApplicationController < ActionController::Base
  respond_to :html, :json

  protect_from_forgery

  def index
    @address = Address.new
    respond_with @address
  end
end
