Sequel.migration do
  up do
    create_table :item_tag do
      primary_key :id
      foreign_key :item_id, :item
      foreign_key :tag_id, :tag
    end
  end
  down do
    drop_table :item_tag
  end
end
