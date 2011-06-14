class AddToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :encrypted_password, :string
  end

  def self.down
    remove_column :members, :encrypted_password
  end
end
