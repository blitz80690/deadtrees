class Tag < Sequel::Model(:tag)
  many_to_many :items, :join_table => :item_tag
end
