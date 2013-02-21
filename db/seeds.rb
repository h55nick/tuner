# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Genre.delete_all
Album.delete_all
Song.delete_all
Artist.delete_all
User.delete_all
Mixtape.delete_all


g1 = Genre.create(:name=>'Classical')
g2 = Genre.create(:name=>'Rock')
g3 = Genre.create(:name=>'Tap 40')
g4 = Genre.create(:name=>'Pop')

s1 =Song.create(:name =>"Thriller")
s2 =Song.create(:name =>"Billie Jean")
s3 =Song.create(:name =>"Bad")
s4 =Song.create(:name =>"Jump")
s5 =Song.create(:name =>"Back in Black")


a1 = Album.create(:name => 'Thriller')
a2 = Album.create(:name => 'Dark Side of the Moon')
a3 = Album.create(:name => 'Back in Black')
a4 = Album.create(:name => 'Yellow Brick Road')

r1 = Artist.create(:name => 'Michael Jackson')
r2 = Artist.create(:name => 'AC/DC')
r3 = Artist.create(:name => 'Beatles')
r4 = Artist.create(:name => 'Elton John')

u1 = User.create(:name=>"Bob", :image => 'x', :password=>'aaaaa',:password_confirmation=>'aaaaa', :is_admin=>false)
u2 = User.create(:name=>"Sam", :image => 'x',:password=>'aaaaa',:password_confirmation=>'aaaaa', :is_admin=>false)
u3 = User.create(:name=>"Joe", :image => 'x', :password=>'aaaaa',:password_confirmation=>'aaaaa')
u4 = User.create(:name=>"Jill", :image => 'x', :password=>'aaaaa',:password_confirmation=>'aaaaa')
u5 = User.create(:name=>"h55nick", :image => 'x', :password=>'aaaaa',:password_confirmation=>'aaaaa', :is_admin=>true)

m1 = Mixtape.create(:name=> 'Workout Music')
m2 = Mixtape.create(:name => 'Programming Music')
m3 =Mixtape.create(:name=>'Party Playlist')
m4 =Mixtape.create(:name=>'Rocker')

#label thriller with
r1.songs  << s1
a1.songs << s1

r2.songs <<  s5
a2.songs << s5

g2.songs << s3 << s5

u1.mixtapes << m4 << m3
u3.mixtapes << m4

m4 = [s1,s2,s5]
u1.albums << a1 << a2
