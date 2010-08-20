class HomepageSlide < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body, :link]

  validates_presence_of :title
  validates_uniqueness_of :title

  belongs_to :photo, :class_name => 'Image'

  def self.all_enabled
    self.find(:all, :order => "position ASC", :conditions => { :enabled => true })
  end

end
