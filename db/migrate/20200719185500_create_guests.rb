class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()', index: true
      t.timestamps
    end
  end
end
