class School < ApplicationRecord
  has_many :users
  has_many :children, through: :users
end
