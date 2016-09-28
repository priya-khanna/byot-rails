class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.integer :user_id
      t.integer :byot_schedule_id
      t.string :name
      t.string :source_url
      t.string :description
      t.string :month

      t.timestamps null: false
    end
  end
end
