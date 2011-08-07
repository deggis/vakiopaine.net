class CreateExhibitions < ActiveRecord::Migration

  def self.up
    create_table :exhibitions do |t|
      t.string :title_fi
      t.string :title_en
      t.string :author
      t.text :description_fi
      t.text :description_en
      t.integer :sample_id
      t.date :starts
      t.date :ends
      t.integer :position

      t.timestamps
    end

    add_index :exhibitions, :id

    load(Rails.root.join('db', 'seeds', 'exhibitions.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "exhibitions"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/exhibitions"})
    end

    drop_table :exhibitions
  end

end
