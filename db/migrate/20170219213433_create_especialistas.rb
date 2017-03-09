class CreateEspecialistas < ActiveRecord::Migration[5.0]
  def change
    create_table :especialistas do |t|
      t.references :universidad, foreign_key: true, :null => true
      t.references :formacion_academica, foreign_key: true, :null => true
      t.references :persona, foreign_key: true, :null => false
      t.string :estatus, :null => false, :default => 1
      t.timestamps
    end
  end
end
