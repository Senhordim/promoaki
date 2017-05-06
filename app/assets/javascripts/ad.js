//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require raphael
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.pt-BR
//= require morrisjs
//= require slimScroll
//= require fastclick
//= require ad/app
//= require jquery.mask
//= require ad/mask
//= require ad/findaddress
//= require turbolinks

$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    language: 'pt-BR'
  });
});

$(function() {
    var flashCallback;
    flashCallback = function() {
        return $(".alert").fadeOut();
    };
    $(".alert").bind('click', (function(_this) {
        return function(ev) {
            return $(".alert").fadeOut();
        };
    })(this));
    return setTimeout(flashCallback, 2500);
});
