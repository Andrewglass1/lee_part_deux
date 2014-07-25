class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end
  end
end
