class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :last_name
      t.string :first_name
      t.date :date_of_birth
      t.string :state
      t.string :spouse_name
    end
  end
end
