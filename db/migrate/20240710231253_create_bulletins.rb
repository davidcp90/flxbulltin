class CreateBulletins < ActiveRecord::Migration[7.2]
  def change
    create_table :bulletins, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.text :summary
      t.timestamp :publishing_date
      t.uuid :author
      t.text :content
      t.boolean :ack_required
      t.boolean :send_email
      t.string :cover_image
      t.uuid :teams, array: true, default: []
      t.text :attachments, array: true, default: []

      t.timestamps
    end
    add_index :bulletins, :slug, unique: true
  end
end
