class AddColumnTasks < ActiveRecord::Migration[5.2]
  def change
		add_column :tasks, :description, :string
		add_column :tasks, :completed, :boolean
  end
end
