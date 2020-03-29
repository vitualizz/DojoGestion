class AreaDatatable < Datatable

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        created_at: record.created_at
      }
    end
  end

  def get_raw_records
    Area.all
  end

end
