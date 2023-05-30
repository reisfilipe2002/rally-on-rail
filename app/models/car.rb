class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_one :order
end
