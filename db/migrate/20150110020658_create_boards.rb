class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.string :category
      t.string :level
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :boards, :users
  end
end
