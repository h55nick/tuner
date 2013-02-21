# == Schema Information
#
# Table name: artists
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  image :string(255)
#

class Artist <ActiveRecord::Base
attr_accessible :name, :image
has_many :songs
has_many :albums, :through => :songs
end
