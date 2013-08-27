jQuery ->
  $('#outages').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#outages').data('source')
