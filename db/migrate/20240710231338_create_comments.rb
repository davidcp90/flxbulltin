class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.timestamp :date
      t.uuid :user
      t.text :message
      t.uuid :thread_id

      t.timestamps
    end
  end
end
