class Restaurant < ApplicationRecord # ActiveRecord::Base
  has_many :reviews, dependent: :destroy
end
