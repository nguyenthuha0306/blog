class Comment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user

  validates :entry_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 1000}
end
