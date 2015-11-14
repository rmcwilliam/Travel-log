class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.stsring :title, null: false
      t.string :description
      t.integer :user_id, null: false
      t.integer :attachment_id, null: false

      t.timestamps null: false
    end
  end
end
