class Store < ActiveRecord::Base
  belongs_to :customer, counter_cache: true
  has_many :tickets

  validates :store_code,  presence: true, length: { is: 6 }, uniqueness: {scope: :customer_id}
  validates :store_name,  presence: true, length: { maximum: 20 }

  geocoded_by :town_name
  after_validation :geocode

end
