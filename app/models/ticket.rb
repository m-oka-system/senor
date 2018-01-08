class Ticket < ActiveRecord::Base
  belongs_to :store
  belongs_to :received_user, foreign_key: "received_user_id", class_name: "User"
  belongs_to :assigned_user, foreign_key: "assign_user_id", class_name: "User"
  # belongs_to :user, foreign_key: "assigned_user_id"

  validates :title, presence: true, length: { maximum: 20 }
  validates :status, presence: true
  validates :receive_date, presence: true
  validates :receive_time, presence: true
  validates :content, length: { maximum: 50 }
  validates :result, length: { maximum: 50 }

end
