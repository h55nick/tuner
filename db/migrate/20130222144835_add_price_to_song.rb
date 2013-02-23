class AddPriceToSong < ActiveRecord::Migration
  def change
      add_column :songs, :price, :decimal, :default => 1.00
  end
end
