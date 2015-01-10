class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.integer :content_format
      t.references :board, index: true

      t.timestamps null: false
    end
    add_foreign_key :lessons, :boards
  end
end
