class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :pickup_address
      t.string :delivery_address
      t.decimal :weight
      t.decimal :distance
      t.datetime :scheduled_time
      t.decimal :cost

      t.timestamps
    end
  end
end
