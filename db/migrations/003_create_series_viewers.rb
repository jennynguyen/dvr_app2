Sequel.migration do
  # if we can infer
  # the opposite action we can use change
  #
# -- CREATE TABLE series_viewers (
# --   -- id           serial       PRIMARY KEY, -- not using this in our join table...
# --   viewer_id integer REFERENCES viewers(id) NOT NULL,
# --   series_id integer REFERENCES series(id) NOT NULL
# -- );

  up do
      create_join_table(:viewer_id =>:viewers, :series_id =>:series) do
      primary_key :id
    end
  end


  down do
    drop_join_table(:series_viewers)
  end
end
