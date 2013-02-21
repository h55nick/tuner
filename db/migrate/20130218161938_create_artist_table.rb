class CreateArtistTable < ActiveRecord::Migration
def change
    create_table :artists do |t|
        t.string :name
        t.string :image
        t.timestamp
    end

end
end
