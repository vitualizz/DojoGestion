class Datatable < AjaxDatatablesRails::ActiveRecord
  
  def view_columns
    {}
  end

  def records
    get_raw_records.page(page).per_page(per_page)
  end
  
  def additional_data
    {
      "total": get_raw_records.count,
      "per_page": per_page,
      "current_page": page,
      "last_page": last_page,
      "next_page_url": next_page,
      "prev_page_url": prev_page,
      "from": 1,
      "to": 10
    }
  end

  private

  def page
    (params[:page] || 1).to_i
  end

  def per_page
    10
  end

  def last_page
    (get_raw_records.count / per_page.to_f).ceil
  end

  def next_page
    return nil if page.eql?(last_page)
    "http://columna.lvh.me:3000/" + params[:controller] + ".json?page=#{page.next}"
  end

  def prev_page
    return nil if page.eql?(1)
    "http://columna.lvh.me:3000/" + params[:controller] + ".json?page=#{page.pred}"
  end
end
