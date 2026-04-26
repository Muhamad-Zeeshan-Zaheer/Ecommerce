class User < ApplicationRecord
  before_validation :set_default_role, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def set_default_role
    self.role ||= "Customer"
  end
end
