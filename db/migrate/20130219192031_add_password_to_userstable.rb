class AddPasswordToUserstable < ActiveRecord::Migration
  def change
      add_column :users, :password_digest, :string, :default => 200.00
  end
end
