class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_one :order

  # include PgSearch::Model
  # pg_search_scope :search_by_model_and_brand,
  # against: [ :model, :brand ],
  # using: {
  #   tsearch: { prefix: true } # <-- now `superman batm` will return something!
  # }
end
