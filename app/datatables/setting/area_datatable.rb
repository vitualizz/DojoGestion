class Setting::AreaDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
    }
  end

  def data
    get_raw_records.map do |record|
      {
        id: record.id,
        name: record.name,
        created_at: record.created_at
      }
    end
  end

  def additional_data
    {
      controller: options[:path]
    }
  end

  def get_raw_records
    # insert query here
    Area.all
  end

end
