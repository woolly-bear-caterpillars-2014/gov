class CreateCongressPeople < ActiveRecord::Migration
  def change
    create_table :congress_people do |t|
    	t.string :first_name, :last_name, :gender, :title, :party, :phone_number, :twitter_id, :youtube_id, :district, :website_url
    	t.belongs_to :state
      t.timestamps
    end
  end
end
