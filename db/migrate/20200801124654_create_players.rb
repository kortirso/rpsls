class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()', index: true
      t.integer :userable_id
      t.string :userable_type
      t.integer :game_id, index: true
      t.timestamps
    end
    add_index :players, [:userable_type, :userable_id]
  end
end
