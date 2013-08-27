jQuery ->
  $('#data_templates').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#data_templates').data('source')

