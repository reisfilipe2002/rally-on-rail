class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_one :order
  pg_search_scope :global_search,
  against: [ :brand, :model ],
  associated_against: {
    price:
  },
  using: {
    tsearch: { prefix: true }
  }
end
