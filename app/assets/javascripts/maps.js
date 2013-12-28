// $(document).ready(function(){

// 	var mapOptions = {
// 		zoom:8,
// 		center: new google.maps.LatLng(),
// 		mapTypeId: google.maps.MapTypeId.ROADMAP
// 	};

// 	var map = new google.maps.Map($('#map')[0], mapOptions);

// });



function get_location() {
  navigator.geolocation.getCurrentPosition(show_map);
}

function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}