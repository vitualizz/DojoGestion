class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def call_action(action, params)
    return self.destroy if action.include?("destroy") && params.nil?
    return self.save if action.include?("create") && params.nil?
    self.send(action, params)
  end
end
