class CreatePlayer < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :phone
      t.integer :age
    end
  end
end

