class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :name, :string, :null=>false
      t.column :email, :string, :null=>false
      t.column :hashed_password, :string, :null=>false
      t.column :salt, :string, :null=>false
      t.column :created_at, :datetime, :null=>false
      t.column :updated_at, :datetime, :null=>false
      t.column :authorization_token, :string
    end
  end

  def self.down
    drop_table :users
  end
end
