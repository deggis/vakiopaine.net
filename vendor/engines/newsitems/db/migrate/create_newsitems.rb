class CreateNewsitems < ActiveRecord::Migration

  def self.up
    create_table :newsitems do |t|
      t.string :title_fi
      t.string :title_en
      t.text :desc_fi
      t.text :desc_en
      t.integer :position

      t.timestamps
    end

    add_index :newsitems, :id

    load(Rails.root.join('db', 'seeds', 'newsitems.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "newsitems"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/newsitems"})
    end

    drop_table :newsitems
  end

end
