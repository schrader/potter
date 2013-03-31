module ApplicationHelper
  def breadcrump(*crumps)
    last_crump = crumps.pop
    
    lis = crumps.map do |crump|
      content_tag(:li) do
        raw(crump.to_s) + raw(' <span class="divider">/</span>')
      end
    end
    
    raw(lis.join + content_tag(:li, last_crump, class: "active"))
  end
end
