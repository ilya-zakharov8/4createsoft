class AddRelationToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :client, foreign_key: true
  end
end
