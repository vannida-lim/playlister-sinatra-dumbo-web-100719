class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.strip.gsub(' ', '-').downcase
    end

    def self.find_by_slug(slug)
        seperated_name = slug.gsub('-', ' ').split
    
        name = "#{seperated_name[0].capitalize} #{seperated_name[1].capitalize}"
        find_by(name: name)
    end

end 