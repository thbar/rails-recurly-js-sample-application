class AddRecurlyEnabledFlag < ActiveRecord::Migration
  def change
    add_column :users, :recurly_enabled, :boolean, default: false
  end
end
