class Customer < ActiveRecord::Base
  validates :customer_name,  presence: true, length: { maximum: 50 }
  validates :business,  presence: true
  validates :phone_number,  presence: true

end
