class CreateCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :calls do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()', index: true
      t.integer :userable_id
      t.string :userable_type
      t.timestamps
    end
    add_index :calls, [:userable_type, :userable_id], unique: true
  end
end
