module ApplicationHelper
  def admin?
    request.env['PATH_INFO'].include? 'admin'
  end

  def current_controller?(name)
    (controller_name == name)? 'active' : 'disabled'
  end

  def menu?
    if (controller_name == 'sessions') or (controller_name == 'msu_lectures' and action_name == 'edit' )
      false
    else
      true
    end
  end

end
