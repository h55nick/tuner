class CreateSongTable < ActiveRecord::Migration
def change
  create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.integer :album_id
      t.string :image
      t.string :filename
      t.timestamps
  end
end
end
