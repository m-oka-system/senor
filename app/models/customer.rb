class Customer < ActiveRecord::Base
  validates :customer_name,  presence: true, length: { maximum: 50 }

end
