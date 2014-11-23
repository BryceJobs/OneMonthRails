class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.text :description

      t.timestamps
    end
  end
end
