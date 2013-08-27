jQuery ->
  $('#events').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#events').data('source')
    "fnServerParams": (aaData) ->
      aaData.push({name: 'q[state_eq]', value: $('#q_state_eq').val() })
      aaData.push({name: 'q[severity_eq]', value: $('#q_severity_eq').val() })
      aaData.push({name: 'q[type_eq]', value: $('#q_type_eq').val() })
  $('#q_state_eq, #q_severity_eq, #q_type_eq').on 'change', (e)->
     @form.submit()
