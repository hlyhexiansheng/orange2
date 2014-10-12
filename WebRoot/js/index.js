require.config({
  baseUrl:'../js',
  paths: {
    'jquery': 'lib/jquery-1.11.1.min',
    'underscore': 'lib/underscore.min'
  },
 shim: {
    'underscore': {
      exports: '_'
    }
  }
});


require(['jquery', 'underscore'], function($, _) {
  
    $(function() {
      // load module for each page
      var dataStart = $("script[data-main][data-start]").attr("data-start") || '';
      var startModules = dataStart.split(',');
      _.each(startModules, function(module) {
        require([module], function(moduleObj) {
          if (moduleObj && moduleObj.init) {
            moduleObj.init();
          }
        });
      });
    });
  });
