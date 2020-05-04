class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_tag_gossip
  has_many :tags, through: :join_table_tag_gossip
end
