ActionController::Routing::Routes.draw do |map|
  map.resources :homepage_slides

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :homepage_slides, :collection => {:update_positions => :post}
  end
end
