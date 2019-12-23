class CreateVideogameSystems < ActiveRecord::Migration[4.2]
  def change
    create_table :videogame_systems do |t|
      t.string :name
      t.string :release_date
      t.string :manufacturer
    end
  end
end
