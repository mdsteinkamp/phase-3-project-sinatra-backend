class ChangePoliciesActiveColumnToStatus < ActiveRecord::Migration[6.1]
  def change
    rename_column :policies, :active, :status
  end
end
