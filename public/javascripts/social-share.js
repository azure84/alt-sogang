if (matchMedia('screen and (min-width: 481px)').matches) {
  /*
   Code supplied from: https://gist.github.com/1025811
   */
  (function(doc, script) {
    var js,
        fjs = doc.getElementsByTagName(script)[0],
        frag = doc.createDocumentFragment(),
        add = function(url, id) {
          if (doc.getElementById(id)) {return;}
          js = doc.createElement(script);
          js.src = url;
          id && (js.id = id);
          frag.appendChild( js );
        };

    // Facebook SDK
    add('//connect.facebook.net/en_US/all.js#xfbml=1&appId=477309145614018', 'facebook-jssdk');
    // Twitter SDK
    add('//platform.twitter.com/widgets.js');

    fjs.parentNode.insertBefore(frag, fjs);
  }(document, 'script'));

} /* end Modernizr polyfill */
