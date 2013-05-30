$ ->
  $('#head-menu li a[href="' + window.location.pathname + '"]').parent().addClass('active')

  toggleDisable = (element) ->
    $(element).attr("disabled",
      (idx, oldAttr) ->
        idx = !oldAttr
    )
     
  toggleDisableSearch = (checkbox,element) ->
    $(checkbox).click ->
      $(this).checked = (idx,oldAttr) ->
        idx = !oldAttr
      toggleDisable(element) 
      toggleDisable(element + ' input') 
      toggleDisable(element + ' select') 

  $('#search-articles').attr("disabled", !$('#check-articles-search').prop("checked"))
  $('#search-articles input').attr("disabled", !$('#check-articles-search').prop("checked"))
  $('#search-articles select').attr("disabled", !$('#check-articles-search').prop("checked"))
  $('#articles').addClass('active') if $('#check-articles-search').prop("checked")
  $('#nav-articles').addClass('active') if $('#check-articles-search').prop("checked")
  toggleDisableSearch('#check-articles-search','#search-articles')

  false
