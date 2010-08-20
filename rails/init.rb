Refinery::Plugin.register do |plugin|
  plugin.name = "homepage_slides"
  plugin.activity = {
    :class => HomepageSlide}

  plugin.directory = directory # tell refinery where this plugin is located
end
