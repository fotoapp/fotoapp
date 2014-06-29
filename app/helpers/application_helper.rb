module ApplicationHelper
  def clear_fixer(index)
    return if index == 0

    index = index + 1
    classes = ["clearfix"]
    if index % 4 == 0
      classes << "visible-lg"
    elsif index % 3 == 0
      classes << "visible-md"
    elsif index % 2 == 0
      classes << "visible-sm"
    end

    return if classes.length == 1

    content_tag :div, "", :class => classes.join(" ")
  end
end
