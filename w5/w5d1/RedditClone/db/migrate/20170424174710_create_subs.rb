class CreateSubs < ActiveRecord::Migration[5.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false, add_index: true
      t.text :description, null: false
      t.integer :moderator_id, null: false, add_index: true
      t.timestamps
    end
  end
end
