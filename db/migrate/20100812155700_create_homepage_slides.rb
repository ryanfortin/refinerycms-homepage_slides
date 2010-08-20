class CreateHomepageSlides < ActiveRecord::Migration

  def self.up
    create_table :homepage_slides do |t|
      t.string :title
      t.text :body
      t.integer :photo_id
      t.string :link
      t.boolean :enabled
      t.integer :position

      t.timestamps
    end

    add_index :homepage_slides, :id

    load(Rails.root.join('db', 'seeds', 'homepage_slides.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Homepage Slides"})

    Page.find_all_by_link_url("/homepage_slides").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/homepage_slides"})

    drop_table :homepage_slides
  end

end
