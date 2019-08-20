class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :company
      t.string :address
      t.string :email
      t.string :tel
      t.datetime :date
      t.text :m2,              default: "<!DOCTYPE html><html><head><title>M2</title></head><body><h1>Salut M2</h1></body></html>"
      t.text :m3,              default: "<!DOCTYPE html><html><head><title>M3</title></head><body><h1>Salut M3</h1></body></html>"
      t.boolean :is_accepted?, default: false

      t.timestamps
    end
  end
end
