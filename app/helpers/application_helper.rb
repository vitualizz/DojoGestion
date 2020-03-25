module ApplicationHelper
  def respond_save(object, method = nil, parameters = nil)
    method = params[:action].eql?("create") ? "save" : "update" if method.nil?
    parameters = params[:controller].split('/').last.singularize + "_params" if method.eql?("update") && parameters.nil?
    respond_to do |format|
      if object.send(method, parameters ? send(parameters) : {})
        format.js { render js: "flashCall('success', 'Se guardo correctamente.');location.reload()"}
      else
        format.js { render js: "flashCall('error', '#{object.errors.full_messages.join('<br/>')}')" }
      end
    end
  end
end
