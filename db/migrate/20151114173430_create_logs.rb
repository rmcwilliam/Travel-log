class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.stsring :title
      t.string :description

      t.timestamps null: false
    end
  end
end
