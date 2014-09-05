class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.references :legislation, index: true

      t.timestamps
    end
  end
end
