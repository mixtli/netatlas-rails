jQuery ->
  $('#nodes').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#nodes').data('source')
    "fnServerParams": (aaData) ->
      aaData.push({name: 'q[state_eq]', value: $('#q_state_eq').val() })
      aaData.push({name: 'q[type_eq]', value: $('#q_type_eq').val() })
  $('#q_state_eq').on 'change', (e)->
     @form.submit()
  $('#q_type_eq').on 'change', (e)->
     @form.submit()
