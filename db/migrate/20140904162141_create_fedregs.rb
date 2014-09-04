class CreateFedregs < ActiveRecord::Migration
  def change
    create_table :fedregs do |t|
    	t.string :type_of_doc
      t.text :title
      t.text :abstract
      t.date :pub_date

      t.timestamps
    end
  end
end
