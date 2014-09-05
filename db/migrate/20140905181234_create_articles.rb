class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :first_paragraph
      t.date :publication_date
      t.text :url
      t.string :source

      t.timestamps
    end
  end
end
