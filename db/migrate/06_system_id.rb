class SystemId < ActiveRecord::Migration[4.2]
  def change
    remove_column :videogame_systems, :system
    add_column :videogames, :system_id, :integer
  end
end
