$ ->
  $("select").dropkick()
  
  
  $(window.location.hash).effect("highlight", {color: "#2ECC71"}, 3000)
  
  
  $(".user_links").hide()
  
  $(".user_links_toggle").click (event)->
    event.preventDefault()
    $(".user_links").toggle()
    $(this).focus()
    
  $(".user_links_toggle").blur ->
    $(".user_links").hide()
  
  $("[title]").tooltip
    container: 'body'
  