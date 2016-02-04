jQuery ->
  $('#groups').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#groups').data('source')

  $('#add-node').on 'change', (e)->
    $.post("/groups/add_node?group_id=" + $(this).data('group-id') + "&node_id=" + $(this).val())
