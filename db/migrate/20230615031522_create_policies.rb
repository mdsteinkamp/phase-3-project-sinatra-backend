class CreatePolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :policies do |t|
      t.string :carrier
      t.string :product
      t.date :policy_date
      t.string :policy_number
      t.integer :face_amount
      t.date :conversion_expiry
      t.string :purpose
      t.string :rate_class
      t.integer :client_id
    end
  end
end
