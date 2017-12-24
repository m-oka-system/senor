class Store < ActiveRecord::Base
  belongs_to :customer

  validates :store_code,  presence: true, uniqueness: {scope: :customer_id}
  validates :store_name,  presence: true, length: { maximum: 20 }


end
