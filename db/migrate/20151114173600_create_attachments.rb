class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :location, null: false 
      t.integer :timestamp, null: false
      t.string :caption, null: false
      t.integer :log_id, null: false 
      t.integer :user_id, null: false
      t.attachment :attachment, null: false 

      t.timestamps null: false
    end
  end
end
