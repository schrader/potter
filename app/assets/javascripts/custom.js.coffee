$ ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $("select").dropkick()
  
  
  $(window.location.hash).effect("highlight", {color: "#2ECC71"}, 3000)
  
  $("[title]").tooltip
    container: 'body'
  