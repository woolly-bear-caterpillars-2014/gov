class CreateArticlesLegislations < ActiveRecord::Migration
  def change
    create_table :articles_legislations do |t|
      t.article :references
      t.legislation :references

      t.timestamps
    end
  end
end
