class Customer < ActiveRecord::Base
  validates :customer_name,  presence: true, length: { maximum: 50 }
  validates :business,  presence: true
  validates :phone_number,  presence: true, format: { with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/ }

  mount_uploader :image, ImageUploader

end