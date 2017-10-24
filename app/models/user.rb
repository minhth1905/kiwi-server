class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :recoverable, :confirmable, :lockable, :trackable
  has_many :portfolios
  devise :database_authenticatable, :recoverable, :lockable, :trackable
  def active?
    status == "active"
  end
end
