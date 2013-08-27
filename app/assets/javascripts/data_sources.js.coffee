jQuery ->
  $('#data_sources').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#data_sources').data('source')

  # Fill in data source options with defaults from data template
  $('#data_source_data_template_id').bind 'change', ->
    return unless $(this).val()
    $.get $(this).data('template-url') + "/" + $(this).val() + ".json", (json)->
      $.each json['data_template'], (k, v)->
        id = '#data_source_' + k
        $(id).val(json['data_template'][k])
      $('#data_source_arguments').val(JSON.stringify(json['data_template']['arguments']))
      # Filter nodes dropdown to nodes matching node type of data template
      $.get "/nodes.json?per_page=1000&type=" + json['data_template']['node_type'], (node_json) ->
        options = []
        $.each node_json, (i,elem)->
          $.each elem, (k, v)->
            options.push {text: v.label, value: v.id}
        console.log(options)
        $('#data_source_node_id').replaceOptions(options)
        
