class ChangeActiveInPoliciesToString < ActiveRecord::Migration[6.1]
  def change
    change_column :policies, :active, :string
  end
end
