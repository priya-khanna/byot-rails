class CreateByotSchedules < ActiveRecord::Migration
  def change
    create_table :byot_schedules do |t|
      t.string :name
      t.date :byot_on
      t.datetime :byot_at
      t.string :description
      t.string :status
      t.datetime :window_opens_at
      t.datetime :window_closes_at
      t.string :remarks
      t.string :month

      t.timestamps null: false
    end
  end
end