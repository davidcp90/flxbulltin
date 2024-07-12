class CreateUserBulletinActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :user_bulletin_activities, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :bulletin_id
      t.boolean :viewed
      t.boolean :ack

      t.timestamps
    end
  end
end
