class GraphTemplate < ActiveRecord::Base
  has_many :items, :class_name => 'GraphTemplateItem'
  has_many :data_templates, :through => :items
  attr_accessible :title, :options

  def as_json(opt = {})
    super(opt.merge(:include => :items))
  end
end
