flot_convert_data = (data) ->
  newdata = []
  for ds_id, ds of data
    for sid, stream of ds
      tmp = []
      for s in stream
        tmp.push([s[0] * 1000, s[1]]) 
      newdata.push(tmp)
  newdata

flot_generate_graphs = ->
  options = { xaxis: {mode: 'time'}}
  for g in $(".graph")
    $.extend(options, $(g).data('options'))
    url = "/graphs/#{$(g).data('id')}/data.json"
    $.get(url, (data) ->
      $.plot($(".graph"), flot_convert_data(data),options)
    )

jQuery ->
  $('#graphs').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#graphs').data('source')
  flot_generate_graphs()

  $('#graph_graph_template_id').bind 'change', ->
    return unless $(this).val()
    $.get $(this).data('template-url') + "/" + $(this).val() + ".json", (json)->
      $.each json['graph_template'], (k, v)->
        id = '#graph_' + k
        $(id).val(json['graph_template'][k])
      $('#graph_options').val(JSON.stringify(json['graph_template']['options']))
      tpl = $.templates('#graph-item-row')
      $.each json['graph_template']['graph_template_items'], (k, item) ->
        $('#graph-items-table').append(tpl.render(item))
 
