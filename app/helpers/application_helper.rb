# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def new_line_to_br(text)
    c = text.strip
    c.gsub /\n/, '<br />'
  end

  # Return true if some user is logged in, false otherwise.
  def logged_in?
    not session[:user_id].nil?
  end

  # Return true if results should be paginated.
  def paginated?
    @pages and @pages.length > 1
  end

  def back_to_course_link
    link_to '<i class="icon-arrow-left"></i> 과목 기본 정보로 돌아가기', {:controller => 'courses', :action => 'show', :id => @course_id}, {:class => 'btn'}
  end


end


#pagination_helper.rb에서 복사해서 재정의함. Bootstrap의 pagination markup에 대응하도록 수정.
module ActionView
  module Helpers
    module PaginationHelper
      def pagination_links(paginator, options={}, html_options={})
        name = options[:name] || DEFAULT_OPTIONS[:name]
        params = (options[:params] || DEFAULT_OPTIONS[:params]).clone

        pagination_links_each(paginator, options) do |n|
          params[name] = n
          "<li>" + link_to(n.to_s, params, html_options) + "</li>"
        end
      end

      def pagination_links_each(paginator, options)
        options = DEFAULT_OPTIONS.merge(options)
        link_to_current_page = options[:link_to_current_page]
        always_show_anchors = options[:always_show_anchors]

        current_page = paginator.current_page
        window_pages = current_page.window(options[:window_size]).pages
        return if window_pages.length <= 1 unless link_to_current_page

        first, last = paginator.first, paginator.last

        html = ''
        if always_show_anchors and not (wp_first = window_pages[0]).first?
          html << yield(first.number)
          html << ' <li class="disabled"> <a href="#" onclick="event.preventDefault();">...</a> </li> ' if wp_first.number - first.number > 1
          html << ' '
        end

        window_pages.each do |page|
          if current_page == page && !link_to_current_page
            html << "<li class=\"active\"><a href=\"#\"  onclick=\"event.preventDefault();\">" + page.number.to_s + "</a></li>"
          else
            html << yield(page.number)
          end
          html << ' '
        end

        if always_show_anchors and not (wp_last = window_pages[-1]).last?
          html << ' <li class="disabled"> <a href="#" onclick="event.preventDefault();">...</a> </li> ' if last.number - wp_last.number > 1
          html << yield(last.number)
        end

        html
      end

    end # PaginationHelper
  end # Helpers
end # ActionView
