require "sequel"

Sequel.migration do
  up do
    create_table :tag do
      primary_key :id
      String :text
    end
  end
  down do
    drop_table :tag
  end
end
