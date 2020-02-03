module NavbarHelper
  def navbar
    menu = [{ title: "home", href: root_path }]
    menu << { title: "qualifications", href: root_path } if current_user.is_student?
    menu
  end
end
