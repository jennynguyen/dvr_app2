Sequel.migration do
  # if we can infer
  # the opposite action we can use change
  up do
    create_table(:genres) do
      primary_key :id
      String :name, :size => 127, :null => false
    end
  end

  down do
    drop_table(:genres)
  end
end
