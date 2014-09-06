class CreateLegislations < ActiveRecord::Migration
  def change
    create_table :legislations do |t|
      t.text :title
      t.date :proposal_date
      t.text :abstract
      t.text :url
      t.timestamps
    end
  end
end
