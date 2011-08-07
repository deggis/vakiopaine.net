class CreateTheaterShows < ActiveRecord::Migration

  def self.up
    create_table :theater_shows do |t|
      t.string :title_fi
      t.string :title_en
      t.text :description_fi
      t.text :description_en
      t.date :starts
      t.date :ends
      t.integer :position

      t.timestamps
    end

    add_index :theater_shows, :id

    load(Rails.root.join('db', 'seeds', 'theater_shows.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "theater_shows"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/theater_shows"})
    end

    drop_table :theater_shows
  end

end
