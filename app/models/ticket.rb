class Ticket < ActiveRecord::Base
  belongs_to :store

  validates :title, presence: true, length: { maximum: 20 }
  # validates :status, presence: true
  # validates :receive_date, presence: true
  # validates :receive_time, presence: true
  # validates :content, length: { maximum: 50 }
  # validates :result, length: { maximum: 50 }

end
