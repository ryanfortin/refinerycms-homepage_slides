class Admin::HomepageSlidesController < Admin::BaseController

  crudify :homepage_slide, :title_attribute => :title

end
