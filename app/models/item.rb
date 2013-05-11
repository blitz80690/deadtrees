class Item < Sequel::Model(:item)
  many_to_many :tags, :join_table => :item_tag
end
