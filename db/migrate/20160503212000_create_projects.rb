class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.date :end_date
      t.integer :funding_goal
      t.string :media_url

      t.timestamps null: false
    end
  end
end
