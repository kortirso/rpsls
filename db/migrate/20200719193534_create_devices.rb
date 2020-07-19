class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()', index: true
      t.string :unique_id
      t.integer :userable_id
      t.string :userable_type
      t.timestamps
    end
    add_index :devices, [:userable_type, :userable_id]
  end
end
