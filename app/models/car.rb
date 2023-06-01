
class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_one :order

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_model,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true }
    }
end
