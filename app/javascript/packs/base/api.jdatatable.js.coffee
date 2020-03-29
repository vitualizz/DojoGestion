window.DataTables =
  Init: ->
    @UserDatatable()

  UserDatatable: ->
    $('#users-datatable').dataTable
      processing: true
      serverSide: true
      ajax:
        url: $('#users-datatable').data('source')
      pagingType: 'full_numbers'
      columns: [
        {data: 'id'}
        {data: 'name'}
      ]
