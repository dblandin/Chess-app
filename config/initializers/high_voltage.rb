HighVoltage.configure do |config|

  # Removes directory "static_pages" from page url
  # When hooking up things, still include static_pages though.
  config.route_drawer = HighVoltage::RouteDrawers::Root

  # Changes default search folder
  config.content_path = '/static_pages'

  # Disables default routes
  config.routes = false

  # Changes default static page layout
  # config.layout = 'static_page_layout'

end
