class User < ActiveRecord::Base

  # never ever change the order of the properties! just add at the end!
  bitmask :roles, :as => [ :admin, :privileged, :user ]
  bitmask :status, :as => [ :deleted, :active, :pending, :doubted ]
  enum sexes: [ :female, :male ]

  after_initialize :set_defaults, :if => :new_record?

  def set_defaults
    self.roles ||= :user
    self.status ||= :pending
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
