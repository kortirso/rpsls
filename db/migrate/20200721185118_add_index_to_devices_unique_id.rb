class AddIndexToDevicesUniqueId < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :users_devices, :unique_id, unique: true, algorithm: :concurrently
  end
end
