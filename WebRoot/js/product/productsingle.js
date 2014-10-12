define(['jquery'], function ($){
  function _callPrivateFunction() {
    console.log('test productsigle module');
  }
  
  return {
    init: function () { 
      _callPrivateFunction();
    },
  }
});
