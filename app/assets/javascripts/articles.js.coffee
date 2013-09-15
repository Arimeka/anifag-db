# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require rich
#= require_tree ./vendor/video-js
#= require video-js

$('body.articles').ready( ->
  $ ->
    $("a[href$='.jpg'],a[href$='.png'],a[href$='.gif']").fancybox();
    category_closer();
    tag_closer();
    return;

  $ ->
    $("select[name='category']").on('change keyup',()->
      value = $(this).val();
      if value && $('input#article_category_ids_[value="' + value + '"]').length == 0
        $('#categories').append('<input id="article_category_ids_" name="article[category_ids][]" type="hidden" value="' + 
                                  value + '">');
        text = $("select[name='category'] option[value=" + value + "]").text();
        $('#categories-lables').append('<li><span class="label label-info">' + 
                                        text + 
                                        '<a class="small-close" id="' + 
                                        value + 
                                        '" href="#">&times;</a></span></li>');
        category_closer();
      return;
    );
    return;

  $ ->
    $('#tag').keypress( ()->
      _this = $(this);
      clearTimeout(timeoutReference) if timeoutReference

      timeoutReference = setTimeout( () ->
              value = _this.val();
              if $('#article_tag_list').val().length > 0
                arr = $('#article_tag_list').val().split(',');
              else
                arr = [];

              if $.inArray(value, arr) == -1
                id = value.replace(/\s+/g, '_').toLowerCase();
                arr.push(value);

                $('#article_tag_list').val(arr.join(','));
                $('#tags-lables').append('<li><span class="label label-info">' + 
                                          value + 
                                          '<a class="small-close" id="' + 
                                          id + 
                                          '" href="#" value="' + 
                                          value + 
                                          '">&times;</a></span></li>');
              
              tag_closer();
              _this.val('');
              return;
          , 1500);
    );
    return;

  category_closer = () ->
    $("#categories-lables a").click((event)->
      event.preventDefault();

      id = $(this).attr('id');  

      $('input#article_category_ids_[value="' + id + '"]').remove();
      $(this).parent().parent().fadeOut();
      return;
    );
    return;

  tag_closer = () ->
    $("#tags-lables a").click((event)->
      event.preventDefault();

      id = $(this).attr('id');
      tag = $(this).attr('value'); 
      arr = $('#article_tag_list').val().split(',');

      arr = $.grep(arr, (value) ->
        value != tag;
      );

      $('#article_tag_list').val(arr.join(','));
      $(this).parent().parent().fadeOut();
      return;
    );
    return;
);