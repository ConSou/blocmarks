class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, length: {minimum: 2}, presence: true
  validates :user, presence: true

end
