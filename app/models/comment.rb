class Comment < ApplicationRecord
  validates :content, presence: true, length: { in: 10..1000 }
  belongs_to :user
  belongs_to :gossip
end
