module ApplicationHelper

  def page_header(content)
    content_for(:page_header) do
      content_tag('div', :class => 'page-header') do
        content_tag('h1', content)
      end
    end
  end

  def side_nav_link_to(body, url, html_options = {})
    content_for(:side_nav) { content_tag("li", link_to(body, url, html_options)) }
  end

  def main_nav_link(body, url, html_options = {})
    li_class = nil
    li_class = "active" if current_page?(url)
    content_tag("li", link_to(body, url, html_options), :class => li_class)
  end

  def pick_it_nav_link
    content_tag("li", "<a href='javascript:void((function()%7Bvar%20e=document.createElement(&apos;script&apos;);e.setAttribute(&apos;type&apos;,&apos;text/javascript&apos;);e.setAttribute(&apos;charset&apos;,&apos;UTF-8&apos;);e.setAttribute(&apos;src&apos;,&apos;#{asset_path('find_it.js')}?r=&apos;+Math.random()*99999999);document.body.appendChild(e)%7D)());'>Pick it</a>".html_safe, :class => "hidden_phone")
  end

  def edit_icon(object, html_options = {})
    link_to(content_tag('i', '', :class => 'icon-edit'),
            {:action => 'edit', :id => object},
            html_options.reverse_merge(:title => 'Edit', :id => dom_id(object, :edit)))
  end

end
