class CreateArticleCongressPeople < ActiveRecord::Migration
  def change
    create_table :article_congress_people do |t|
    	t.belongs_to :article
    	t.belongs_to :congress_person

      t.timestamps
    end
  end
end
