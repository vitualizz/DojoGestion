
window.DataTables =
  Init: ->
    @TeacherDatatable()

  TeacherDatatable: ->
    $('#teacher-datatable').dataTable
      ajax:
        url: $('#users-datatable').data('source')
      columns: [
        {data: 'id'}
        {data: 'name'}
      ]
