class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :location
      t.integer :timestamp
      t.string :caption

      t.timestamps null: false
    end
  end
end
