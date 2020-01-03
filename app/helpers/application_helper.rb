module ApplicationHelper

  # I18n Internationalization
  def t_model(field, *args)
    t(field.to_sym, scopes: args.present? ? [:models, args] : nil)
  end
end
