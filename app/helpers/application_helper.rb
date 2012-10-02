module ApplicationHelper
  def action_buttons obj
    methodized = obj.class.name.underscore
    human_name = obj.class.name.underscore.humanize.downcase

    link_to(
      content_tag(:i, '', class: 'icon-edit'),
      send(:"edit_#{methodized}_path", obj),
      class: 'btn btn-mini',
      title: "Edit this #{human_name}"
    ) + ' ' +
    link_to(
      content_tag(:i, '', class: 'icon-trash'),
      obj,
      class: 'btn btn-mini',
      title: "Delete this #{human_name}",
      method: :delete,
      data: { confirm: "Are you sure you want to delete this #{human_name}?" }
    )
  end
end
