class CreateLegislations < ActiveRecord::Migration
  def change
    create_table :legislations do |t|
    	t.integer :number
      t.string :bill_id
      t.string :pdf_url
      t.string :introduced_on
      t.string :last_version_on
      t.text :official_title
      t.text :short_title

      t.references :congress_person, index: true

      t.timestamps
    end
  end
end