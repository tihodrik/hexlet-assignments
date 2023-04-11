class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.string :status, default: "new", null: false
      t.string :creator, null: false
      t.string :performer
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
