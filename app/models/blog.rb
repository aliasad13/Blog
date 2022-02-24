class Blog < ApplicationRecord
 has_many :comments, dependent: :destroy
 belongs_to :user

  validates :title,presence: true
  validates :content,presence: true, length: {minimum: 10}
  validates :desc,presence: true, length: {maximum: 50}

end
