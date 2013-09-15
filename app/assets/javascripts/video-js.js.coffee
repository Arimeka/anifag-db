$ ->
  $.each(
    $('.video-js'), ->
      if $.isArray($('source', this)) == false 
        if $('source', this).attr('type') == 'video/youtube'
          videojs(this.id, { 
            "autoplay": false, 
            "preload": false,
            "ytcontrols": true,
            "techOrder": ["youtube"]
            });
        if $('source', this).attr('type') == 'video/vimeo'
          this.src = $('source', this).attr('src')
          videojs(this.id, { 
            "controls": true,
            "autoplay": false, 
            "preload": false,
            "techOrder": ["vimeo"]
            });
  );