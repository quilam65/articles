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
//= require bootstrap

//= require jquery

$(window).ready(function(){
  var currentdate = new Date()
  $('#time_1i option[value='+currentdate.getFullYear()+']').attr('selected','selected');
  $('#time_2i option[value='+(currentdate.getMonth()+1)+']').attr('selected','selected');
  $('#time_3i option[value='+currentdate.getDate()+']').attr('selected','selected');
  $('#time_4i option[value='+currentdate.getHours()+']').attr('selected','selected');
  $('#time_5i option[value='+currentdate.getMinutes()+']').attr('selected','selected');
});
