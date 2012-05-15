class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :id
  has_many :event_user
  has_many :event, :through => :event_user
  has_many :dinner_like
  has_many :dinner, :through => :dinner_like
  accepts_nested_attributes_for :event, :dinner, :event_user, :dinner_like

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

end
