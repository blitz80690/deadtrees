Sequel.migration do
  change do
    alter_table :tag do
      add_unique_constraint :text
    end
  end
  down do
    alter_table :tag do
      drop_constraint :tag_text_key
    end
  end
end
