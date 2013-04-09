jQuery ->
  $("#products").sortable
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

$(document).ready ->
  $("#lang-switch").css "cursor", "pointer"
  $("#lang-switch").click ->
    
    #change the image src for info img
    src = $("#info-img").attr("src")
    if src is "/assets/info-est.png"
      $("#info-img").attr "src", "/assets/info-eng.png"
      $(".ee").css "display", "none"
      $(".eng").css "display", "block"
      $("#lang-switch").text "eesti keeles"
    else
      $("#info-img").attr "src", "/assets/info-est.png"
      $(".ee").css "display", "block"
      $(".eng").css "display", "none"
      $("#lang-switch").text "in English"

  $("img").click ->
    elementID = $(this).attr("id")
    $(".infobox").each (i) ->
      if $(this).hasClass(elementID)
        $(this).show()
      else
        $(this).hide()
