module ApplicationHelper
  def respond_action(object, **args)
    @object = object
    method = args[:method] || params[:action].eql?("create") ? "save" : "update"
    parameters = args[:parameters] || params[:controller].split('/').last.singularize + "_params" if request.put? || request.patch?
    respond_to do |format|
      if object.send(method, parameters ? send(parameters) : {})
        format.js { render partial: 'shared/action'}
      else
        format.js { render js: "flashCall('error', '#{@object.errors.full_messages.join('<br/>')}')" }
      end
    end
  end
end
