class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.boolean :relevant
      t.integer :stars

      t.timestamps
    end
  end
end
