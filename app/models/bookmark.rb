class Bookmark < ApplicationRecord
  belongs_to :topic, dependent: :destroy
end
