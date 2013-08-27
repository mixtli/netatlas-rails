jQuery ->
  $('#interfaces').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#interfaces').data('source')
