class CreateTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name
      t.text :description
      t.uuid :organization

      t.timestamps
    end
  end
end
