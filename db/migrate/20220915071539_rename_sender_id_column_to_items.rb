class RenameSenderIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sender_id, :prefecture_id
  end
end
