module ApplicationHelper
  def hide_modal
    action_name != "create" ? "fade" : ""
  end
end
