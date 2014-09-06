class CreateCongressPeople < ActiveRecord::Migration
  def change
    create_table :congress_people do |t|
    	t.string :first_name, :last_name, :title, :party, :phone_number, :twitter_account, :facebook_account, :votes_with_party_pct, :website_url, :missed_votes_pct, :youtube_id, :seniority, :district, :next_election
    	t.belongs_to :state
    	t.string :picture_id
      t.timestamps
    end
  end
end


