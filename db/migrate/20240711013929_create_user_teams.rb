class CreateUserTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :user_teams, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :team_id

      t.timestamps
    end
  end
end
