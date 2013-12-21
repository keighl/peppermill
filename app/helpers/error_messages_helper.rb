module ErrorMessagesHelper

  def error_messages_for(object)
    unless object.errors.empty?
      list_items = object.errors.full_messages.map { |msg| content_tag(:li, msg) }
      list       = content_tag(:ul, list_items.join.html_safe)
      header     = content_tag(:h4, t("there_were_errors"), :class => "alert-heading")
      box        = content_tag(:div, header + " " + list, :class => "alert alert-block alert-error")
    end
  end

  def admin_error_messages_for(object)
    unless object.errors.empty?
      close      = content_tag(:a, "x", :class => "close", :href => "#", :"data-dismiss" => "alert")
      list_items = object.errors.full_messages.map { |msg| content_tag(:li, msg) }
      list       = content_tag(:ul, list_items.join.html_safe)
      header     = content_tag(:h4, t("there_were_errors"), :class => "alert-heading")
      box        = content_tag(:div, close + " " + header + " " + list, :class => "alert alert-block alert-error")
    end
  end

  module FormBuilderAdditions
    def error_messages
      @template.error_messages_for(@object)
    end

    def admin_error_messages
      @template.admin_error_messages_for(@object)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
