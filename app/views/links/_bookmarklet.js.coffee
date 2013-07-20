pb = ->
  getSelectedText = ->
    window.getSelection() || document.getSelection() || document.selection.createRange().text

  selectedTextParam = ""
  urlParam = "url=" + encodeURIComponent(document.location)

  if(getSelectedText())
    selectedTextParam = "&name=" + encodeURIComponent(getSelectedText())

  document.location = "<%= "#{request.protocol}#{request.host_with_port}" %>/links/new?" + urlParam + selectedTextParam 

pb()