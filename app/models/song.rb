# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  artist_id  :integer
#  album_id   :integer
#  image      :string(255)
#  filename   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :decimal(, )      default(1.0)
#

class Song < ActiveRecord::Base
attr_accessible :name, :image, :filename,:genre_ids,:artist_ids,:album_ids,:price,:mixtape_ids

      belongs_to :album
      belongs_to :artist
      has_and_belongs_to_many :mixtapes
      has_and_belongs_to_many :genres

      def player
        filepath = nil
          if !self.filename.nil? && !self.filename.split("watch?v=")[1].nil?
           filepath = self.filename.split("watch?v=")[1]
           stringone = '<object type="application/x-shockwave-flash" width="150" height="25" data="https://www.youtube-nocookie.com/v/'
           stringone +=filepath
           stringone += "?version=2&theme=dark\"><param name='movie' value='https://www.youtube-nocookie.com/v/"
           stringone +=filepath
           stringone += "?version=2&theme=dark' /><param name='wmode' value='transparent' /></object>"
         else
          stringone = "Incorrect Filepath Provided. Please Edit"
         end
           stringone
      end
end
