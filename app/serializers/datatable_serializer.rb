class DatatableSerializer
  include FastJsonapi::ObjectSerializer

  def to_hash
    data = super
    data[:data] = data[:data].map {|x| x.merge(x.delete(:attributes)) if x[:attributes].present? }
    data
  end
end
