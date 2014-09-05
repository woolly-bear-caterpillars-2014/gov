class CreateArticlesLegislations < ActiveRecord::Migration
  def change
    create_table :articles_legislations do |t|
      t.references :article, index: true
      t.references :legislation, index: true

      t.timestamps
    end
  end
end
