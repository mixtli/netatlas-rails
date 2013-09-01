class Datatable  
  delegate :params, :h, :link_to, :number_to_currency, :polymorphic_path, to: :@view
  class_attribute :model
  class_attribute :columns
  class_attribute :default_scope
  class_attribute :sort_columns

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: self.class.model.count,
      iTotalDisplayRecords: resources.total_entries,
      aaData: data
    }
  end


  def method_missing(method, *args, &block)
    @view.send(method, args, block)
  end

  def resources 
    @resources ||= fetch_resources
  end

  def fetch_resources
    resources = default_scope.call.search(params[:q]).result.order("#{sort_column} #{sort_direction}")
    resources = resources.page(page).per_page(per_page)
    if params[:sSearch].present?
      resources = resources.term_search(params[:sSearch])
    end
    resources  
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page 
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10 
  end

  def sort_direction
    params[:sSortDir_0] == 'desc' ? 'desc' : 'asc'
  end

  def sort_column
    col = self.class.columns[params[:iSortCol_0].to_i]
    if self.class.sort_columns && self.class.sort_columns[col]
      col = self.class.sort_columns[col]
    end
    col
  end

  def data
    resources.map { |resource| row(resource) + actions(resource) }
  end
  def actions(resource)
    [
      link_to('Show', resource) + " " +
      link_to('Edit', polymorphic_path([:edit, resource])) + " " +
      link_to('Delete', resource, :method => :delete, :data => {:confirm => 'Are you sure?'})
    ]
  end

end
