class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.column :address , :string
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :emails
  end
end
