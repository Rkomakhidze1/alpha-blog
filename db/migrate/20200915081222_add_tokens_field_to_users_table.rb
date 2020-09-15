class AddTokensFieldToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tokens, :string, array: true, default: []
  end
end
