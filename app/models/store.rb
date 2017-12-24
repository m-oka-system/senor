class Store < ActiveRecord::Base
  belongs_to :customer

  validates :store_code,  presence: true, length: { is: 6 }, uniqueness: {scope: :customer_id}
  validates :store_name,  presence: true, length: { maximum: 20 }


end
