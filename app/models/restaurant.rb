class Restaurant < ApplicationRecord # ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }
end
