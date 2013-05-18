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

  def pot_nav_link(pot)
    if (params[:pot_id] || params[:id]) == pot.id.to_s
      return link_to pot.name, pot, class: "active"
    else
      return link_to pot.name, pot, class: "inactive"
    end
  end
end
