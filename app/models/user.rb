class User < ApplicationRecord
  belongs_to :school

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:caregiver, :school_manager, :admin]

  def set_default_role
    self.role ||= :user
  end
end
