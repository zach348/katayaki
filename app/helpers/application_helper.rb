module ApplicationHelper
  def render_footer?
    params[:controller] == 'goals' && !(params[:action] == 'show' || params[:action] == 'new')
  end
end
