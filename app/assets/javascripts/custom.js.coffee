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

  checkDisable = (checkbox,element) ->
    $(element).attr("disabled", !$(checkbox).prop("checked"))
    $(element + ' input').attr("disabled", !$(checkbox).prop("checked"))
    $(element + ' select').attr("disabled", !$(checkbox).prop("checked"))
    
  checkDisable('#check-articles-search','#search-articles')

  $('#articles').addClass('active') if $('#check-articles-search').prop("checked")
  $('#nav-articles').addClass('active') if $('#check-articles-search').prop("checked")

  toggleDisableSearch('#check-articles-search','#search-articles')

  false
