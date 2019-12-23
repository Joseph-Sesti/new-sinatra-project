class VideogameForeignKey < ActiveRecord::Migration[4.2]
  def change
    add_column :videogames, :user_id, :integer
  end
end
