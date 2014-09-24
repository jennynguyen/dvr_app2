Sequel.migration do
# -- DROP TABLE IF EXISTS flags;
# -- DROP TABLE IF EXISTS flags_episodes;
# -- CREATE TABLE flags (
# --   id   serial       PRIMARY KEY,
# --   name varchar(127) NOT NULL
# -- );

  up do
    create_table(:flags) do
      primary_key :id
      String :name, :size => 127, :null => false
    end
  end

  down do
    drop_table(:flags)
  end
end

