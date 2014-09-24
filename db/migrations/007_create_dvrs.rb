
# Sequel.migration do

# # -- CREATE TABLE dvrs (
# # --   id              serial  PRIMARY KEY, -- not using this in our join table...
# # --   serial_number   integer NOT NULL,
# # --   hard_drive_size integer NOT NULL,
# # --   zip_code        varchar(5) NOT NULL
# # -- );

#   up do
#     create_table(:dvrs) do
#       primary_key :id
#       String :name, :size => 127, :null => false
#     end
#   end

#   down do
#     drop_table(:flags)
#   end
# end
