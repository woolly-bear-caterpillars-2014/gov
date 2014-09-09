class LegislationCongressPerson < ActiveRecord::Base
  belongs_to :legislation
  belongs_to :congress_person
end
