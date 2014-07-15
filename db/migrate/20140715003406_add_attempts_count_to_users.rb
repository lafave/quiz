class AddAttemptsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :attempts_count, :integer
  end
end
