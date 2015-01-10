class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.string :category
      t.string :level


      t.timestamps null: false
    end
  end
end
