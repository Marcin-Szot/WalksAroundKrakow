class Post < ActiveRecord::Base
  has_many :images, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true, length: {minimum: 5}
end
