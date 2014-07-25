class CreateInfoContents < ActiveRecord::Migration
  def change
    create_table :info_contents do |t|
      t.text :column_1
      t.text :column_2
      t.text :column_3

      t.timestamps
    end
  end
end
