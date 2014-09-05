class CreateLegislations < ActiveRecord::Migration
  def change
    create_table :legislations do |t|
      t.text :title
      t.date :proposal_date
      t.date :publication_date
      t.date :congress_voting_date
      t.date :senate_voting_date
      t.date :president_signing_date
      t.text :abstract
      t.text :url
      t.string :type

      t.timestamps
    end
  end
end
