class RenameStatusIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :status_id, :prefecture_id
  end
end
