require 'declarative_authorization/maintenance'

Authorization::Maintenance::without_access_control do
  GraphTemplate.seed(:id) do |s|
    s.id = 1
    s.title = 'Traffic'
  end
  GraphTemplateItem.seed(:id) do |s|
    s.graph_template_id = 1
    s.data_template_id = 3
    s.label = 'Inbound Traffic'
    s.cdef = '($value - $previous_value)/($time - $previous_time) * 8'
    s.units = 'bps'
    s.id = 1
  end

  GraphTemplateItem.seed(:id) do |s|
    s.graph_template_id = 1
    s.data_template_id = 4
    s.label = 'Outbound Traffic'
    s.cdef = '($value - $previous_value)/($time - $previous_time) * 8'
    s.units = 'bps'
    s.id = 2
  end
end
