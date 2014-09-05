class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :first_paragraph
      t.date :publication_date
      t.string :url
      t.string :source

      t.timestamps
    end
  end
end
