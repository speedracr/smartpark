$(document).ready(function() {
  set_current_location()

  $(".simple_form" ).submit(function(e){
    e.preventDefault();
    form = this
    $(form).unbind('submit');
    
    use_current_location()

            
  })

});


function set_current_location() {
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      currentLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
    }, null);
  }
}

function use_current_location(){
  latlng = currentLocation;
  set_parking_lat_lng()
}

function set_parking_lat_lng() {
  $("#parking_lat")[0].value = latlng.lat();
  $("#parking_lng")[0].value = latlng.lng();    
  console.log($("#parking_lat")[0].value);
  $(form).trigger('submit');
}