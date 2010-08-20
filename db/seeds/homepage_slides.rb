User.find(:all).each do |user|
  user.plugins.create(:name => "homepage_slides",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end

page = Page.create(
  :title => "Homepage Slides",
  :link_url => "/homepage_slides",
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => "parent_id IS NULL") || -1)+1),
  :menu_match => "^/homepage_slides(\/|\/.+?|)$"
)
RefinerySetting.find_or_set(:default_page_parts, ["Body", "Side Body"]).each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
