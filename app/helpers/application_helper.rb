module ApplicationHelper

  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def conditional_html( lang = "en", &block )
    haml_concat Haml::Util::html_safe <<-"HTML".gsub( /^\s+/, '' )
      <!--[if lt IE 7]>     <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
      <!--[if IE 7]>        <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
      <!--[if IE 8]>        <html class="no-js lt-ie9 ie8" lang="en"> <![endif]-->
      <!--[if IE 9]>        <html class="no-js ie9" lang="en"> <![endif]-->
      <!--[if gt IE 8]>     <!--> <html class="no-js" lang="en"> <!--<![endif]-->
    HTML
    haml_concat capture( &block ) << Haml::Util::html_safe( "\n</html>" ) if block_given?
  end
end
