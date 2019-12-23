class VideogameSystem < ActiveRecord::Base
  belongs_to :user
  has_many :videogames
end
