class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :project_type
      t.string :location

      t.timestamps
    end
  end
end
