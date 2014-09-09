class Legislation < ActiveRecord::Base
  has_many :legislation_congress_people
  has_many :congress_people, through: :legislation_congress_people
end
