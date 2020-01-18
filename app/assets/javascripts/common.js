/* global $ */

/* drawer */
$(function(){
  $('.drawer-nav').css('display','none');
  $('.drawer-icon').on('click', function () {
    $('.drawer-nav').slideToggle(300); 
    $(this).toggleClass('m_checked');
  });
});

/* datepicker */
$(function () {
  $('.datepicker').datetimepicker({
    format: 'YYYY-MM-DD',
    icons: {
      previous: "fa fa-arrow-left",
      next: "fa fa-arrow-right"
    }
  });
});


/* global google */
function initMap(){
  let map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: -34.397, lng: 150.644},
  zoom: 8
  });
}