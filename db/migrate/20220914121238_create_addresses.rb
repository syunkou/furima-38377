class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :zipcode,      null: false
      t.integer    :status_id,    null: false
      t.string     :city,         null: false
      t.string     :address1,     null: false
      t.string     :address2
      t.string     :phone_number, null: false
      t.references :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
