module NavbarHelper
  def navbar
    menu = [{ title: current_user.username, href: root_path, icon: 'el-icon-user-solid' },
            { title: "home", href: root_path, icon: 'el-icon-s-home' }]
    if current_user.is_teacher?
      menu << { title: "students", href: root_path, icon: 'el-icon-notebook-1' }
    end
    if current_user.is_student?
      menu << { title: "teachers", href: root_path, icon: 'el-icon-s-custom' }
    end
    if current_user.is_student? || current_user.is_teacher?
      menu << { title: "qualifications", href: qualifications_path, icon: 'el-icon-notebook-2' }
    end
    menu << { title: "Cerrar Session", href: destroy_session_path(current_user), icon: 'fas fa-sign-out-alt', attributes: { "data-method": "delete"}}
    menu
  end
end
