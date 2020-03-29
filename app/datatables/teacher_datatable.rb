class TeacherDatatable < Datatable


  def data
    get_raw_records.map do |record|
      {
        id: record.id,
        name: record.fname
      }
    end
  end

  def get_raw_records
    Teacher.all
  end

end
