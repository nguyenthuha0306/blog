class Comment < ActiveRecord::Base
  belongs_to :entry
  validates :content, presence: true
  validates :entry_id, presence: true, length:{maximum: 140}
end
