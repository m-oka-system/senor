class Store < ActiveRecord::Base
  belongs_to :customer

  validates :store_code,  presence: true
  validates :store_neme,  presence: true, length: { maximum: 20 }


end
