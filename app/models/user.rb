class User < ApplicationRecord
  belongs_to :school
  has_many :children, dependent: :destroy
  accepts_nested_attributes_for :children

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:caregiver, :school_manager, :admin, :area_manager]

  def set_default_role
    self.role ||= :caregiver
  end
end
