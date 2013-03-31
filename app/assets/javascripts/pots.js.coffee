$ ->
  $(".newlink").show()
  $(".new_link_form").hide()
  
  $(".newlink").click ->
    $(".newlink").hide()
    $(".new_link_form").slideDown("slow")