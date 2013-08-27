# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :graph_template_item, :class => 'GraphTemplateItems' do
    graph_template nil
    data_template nil
    options ""
  end
end
