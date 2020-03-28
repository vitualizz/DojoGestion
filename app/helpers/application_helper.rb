module ApplicationHelper
  def respond_action(object, **args)
    @object, @args = object, args
    method = @args[:method] || params[:action]
    parameters = @args[:parameters] || action_parameters unless request.delete? || request.post?
    respond_to do |format|
      if object.call_action(method, parameters && send(parameters))
        format.js { render partial: 'shared/action'}
      else
        format.js { render js: "flashCall('error', '#{@object.errors.full_messages.join('<br/>')}')" }
      end
    end
  end

  private

  def action_parameters
    params[:controller].split('/').last.singularize + "_params" if request.put? || request.patch?
  end
end
