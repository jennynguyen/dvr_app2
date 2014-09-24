
Sequel.migration do

# - CREATE TABLE flags_episodes (
# --   id        serial  PRIMARY KEY, -- not using this in our join table...
# --   episode_id integer NOT NULL,
# --   series_id  integer NOT NULL
# -- );

  up do
      create_join_table(:episode_id =>:episodes, :series_id =>:series) do
      primary_key :id
    end
  end


  down do
    drop_join_table(:flags_episodes)
  end
end
