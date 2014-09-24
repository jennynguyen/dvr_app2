Sequel.migration do
#  -- CREATE TABLE genres_series (
# --   id        serial  PRIMARY KEY, -- not using this in our join table...
# --   series_id integer NOT NULL,
# --   genre_id  integer NOT NULL
# -- );

  up do
      create_join_table(:series_id =>:series, :genre_id =>:genres) do
      primary_key :id
    end
  end


  down do
    drop_join_table(:genres_series)
  end
end
