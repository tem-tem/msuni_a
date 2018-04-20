module ApplicationHelper
  def admin?
    request.env['PATH_INFO'].include? 'admin'
  end

  def current_controller?(name)
    (controller_name == name)? 'active' : 'disabled'
  end

end
