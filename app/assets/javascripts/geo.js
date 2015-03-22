function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(52, 13),
      zoom: 12
    };

    var styleArray = [
          {
          featureType: "all",
          stylers: [
            { saturation: -60 }
          ]
        },{
          featureType: "road.arterial",
          elementType: "geometry",
          stylers: [
            { hue: "#00ffee" },
            { saturation: 50 }
          ]
        },{
          featureType: "poi.business",
          elementType: "labels",
          stylers: [
            { visibility: "off" }
          ]
        }
      ];
    
    map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);

    // map2 = new google.maps.Map(document.getElementById("map-canvas-sm"),
    //     mapOptions);

    map.setOptions({styles: styleArray});  

}

function start_map() {
  google.maps.event.addDomListener(window, 'load', initialize);
  set_center(); 
  console.log("Done.");
}


function set_center() {
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
      console.log(initialLocation);
      // map2.setCenter(initialLocation);
     }, 
     // function() {
    //   handleNoGeolocation(browserSupportFlag);
    // }
    null);
  }
}

