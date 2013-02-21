# == Schema Information
#
# Table name: artists
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  image :string(255)
#

class Artist <ActiveRecord::Base
attr_accessible :name, :image, :album_ids, :song_ids
has_many :songs
has_many :albums, :through => :songs
validates :name ,:uniqueness => true, :presence => true

end
