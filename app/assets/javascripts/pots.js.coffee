$ ->
#  toggleContainerLinkBindings($(".newlink"), $(".new_link_form"))
#  toggleContainerLinkBindings($(".show_pot_links"), $("#pot_links"))



toggleContainerLinkBindings = (link, container) ->
  link.show()
  container.hide()
  
  link.click (event) ->
    link.hide()
    container.slideDown("slow")
    event.preventDefault()