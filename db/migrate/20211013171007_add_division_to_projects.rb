class AddDivisionToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :division, :string
  end
end
