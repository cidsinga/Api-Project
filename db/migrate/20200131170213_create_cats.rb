class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :color
      t.boolean :kid_friendly
      t.integer :age

      t.timestamps()
    end
  end
end
