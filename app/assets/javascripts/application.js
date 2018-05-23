// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks

//= require simplemde.min
//= require showdown.min
//= require marked
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

// if (history && history.pushState){
//   $(function(){
//    $('body').on('click', 'a', function(e){
//       $.getScript(this.href);
//       history.pushState(null, '', this.href);
//     });
//     $(window).bind("popstate", function(){
//       $.getScript(location.href);
//     });
//   });
// }


function copyImageLink(id) {
  var copyText = $('#' + id);
  copyText.select();
  document.execCommand("copy");
}

var currentDisciplineId = null;

