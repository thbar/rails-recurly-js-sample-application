class AddRecurlyAccountCode < ActiveRecord::Migration
  def change
    add_column :users, :recurly_account_code, :string
    add_index :users, :recurly_account_code, unique: true
  end
end
