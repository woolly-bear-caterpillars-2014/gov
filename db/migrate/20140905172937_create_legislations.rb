class CreateLegislations < ActiveRecord::Migration
  def change
    create_table :legislations do |t|
      t.string :title
      t.date :proposal_date
      t.date :publication_date
      t.date :congress_voting_date
      t.date :senate_voting_date
      t.date :president_signing_date
      t.text :abstract
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end
