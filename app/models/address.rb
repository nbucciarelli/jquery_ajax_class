class Address < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :address, :city, :state, :zip

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :format => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true


end
