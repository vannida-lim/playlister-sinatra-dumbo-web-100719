class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs


    def slug
        self.name.strip.gsub(' ', '-').downcase
    end

    def self.find_by_slug(slug)
        seperated_name = slug.gsub('-', ' ').split
    
        name = "#{seperated_name[0].capitalize} #{seperated_name[1].capitalize}"
        find_by(name: name)
    end

   
end