class CreateUsersSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :users_sessions do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()', index: true
      t.integer :userable_id
      t.string :userable_type
      t.timestamps
    end
    add_index :users_sessions, [:userable_type, :userable_id]
  end
end
