class CreateGuestbookNotes < ActiveRecord::Migration

  def self.up
    create_table :guestbook_notes do |t|
      t.string :writer_name
      t.text :note
      t.datetime :left
      t.text :response
      t.integer :position

      t.timestamps
    end

    add_index :guestbook_notes, :id

    load(Rails.root.join('db', 'seeds', 'guestbook_notes.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "guestbook_notes"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/guestbook_notes"})
    end

    drop_table :guestbook_notes
  end

end
