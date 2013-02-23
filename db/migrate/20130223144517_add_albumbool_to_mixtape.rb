class AddAlbumboolToMixtape < ActiveRecord::Migration
  def change
  add_column :mixtapes, :is_album, :boolean, :default => false
  end
end
