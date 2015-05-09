class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true, length: {maximum: 2000}
  validate :picture_size

  private

  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture,"should be less than 5 MB")
  	end
  end

end
