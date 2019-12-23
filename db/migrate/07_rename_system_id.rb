class RenameSystemId < ActiveRecord::Migration[6.0]
  def change
    rename_column :videogames, :system_id, :videogame_system_id
  end
end
