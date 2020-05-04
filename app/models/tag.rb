class Tag < ApplicationRecord
  has_many :join_table_tag_gossip
  has_many :gossips, through: :join_table_tag_gossip
end
