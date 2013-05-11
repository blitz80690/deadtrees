Sequel.migration do
  up do
    create_table :item do
      primary_key :id
      String :title
      String :author
      String :publisher
      String :isbn, :unique => true
      Integer :quantity, :default => 1
      Integer :binding_id
      Integer :edition_id
      Text :notes
      String :series
      String :image
      Date :published_at
      DateTime :created_at, :default => "CURRENT_TIMESTAMP".lit
      DateTime :updated_at
    end
  end
  down do
    drop_table :item
  end
end
