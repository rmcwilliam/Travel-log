class RemoveColumnFromTableLogs < ActiveRecord::Migration
  def change
    remove_column :logs, :attachment_id, :integer
  end
end
