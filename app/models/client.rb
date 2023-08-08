class Client < ActiveRecord::Base
  has_many :policies

  def delete_all_policies
    self.policies.destroy_all
  end

end