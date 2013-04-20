$ ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $("select").dropkick()
  
  
  $(window.location.hash).effect("highlight", {color: "#2ECC71"}, 3000)
  
  
  $(".user_links").hide()
  
  $(".user_links_toggle").click (event)->
    event.preventDefault()
    $(".user_links").show()

    $(document).click (e) ->
      if (! $(e.target).closest('.user_links_container').length ) 
        $('.user_links').hide()

  
  $("[title]").tooltip
    container: 'body'
  