class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.legislation :references

      t.timestamps
    end
  end
end
