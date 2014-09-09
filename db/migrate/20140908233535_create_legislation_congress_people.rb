class CreateLegislationCongressPeople < ActiveRecord::Migration
  def change
    create_table :legislation_congress_people do |t|
      t.references :legislation, index: true
      t.references :congress_person, index: true

      t.timestamps
    end
  end
end
