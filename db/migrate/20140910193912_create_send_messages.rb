class CreateSendMessages < ActiveRecord::Migration
  def change
    create_table :send_messages do |t|

      t.timestamps
    end
  end
end
