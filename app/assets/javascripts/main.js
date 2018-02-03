function animate( $that, percentage ) {
  if ( !$that.hasClass('fill') ) return;
  $that.removeClass('fill');

  percentage = (100 - percentage) || 0;
  var percentage_initial = 100,
      percentage_current = percentage_initial,
      interval = 0.5;

  var interval_gradient = setInterval(function(){
    $that.css(
      'background',
      'linear-gradient(#a0c884 '+percentage_current+'%,#426e1f '+percentage_current+'%)'
    );
    percentage_current -= interval;
    if(percentage_current <= percentage) clearInterval(interval_gradient);
  }, 5);

  $that.addClass('filled');
};

$('.fill').on('click', function() {
  var $that = $(this);
  var percentage = $that.attr('data-fill');
  setTimeout(function(){
    animate( $that, percentage )
  }, 400);
});

var map = null;
  var radius_circle;
  var markers_on_map = [];
  var geocoder;
  var infowindow;

  //all_locations is just a sample, you will probably load those from database
  var all_locations = [
	  {type: "Restaurant", name: "Restaurant 1", lat: 40.723080, lng: -73.984340},
	  {type: "School", name: "School 1", lat: 40.724705, lng: -73.986611},
	  {type: "School", name: "School 2", lat: 40.724165, lng: -73.983883},
	  {type: "Restaurant", name: "Restaurant 2", lat: 40.721819, lng: -73.991358},
	  {type: "School", name: "School 3", lat: 40.732056, lng: -73.998683}
  ];

  //initialize map on document ready
  $(document).ready(function(){
      var latlng = new google.maps.LatLng(40.723080, -73.984340); //you can use any location as center on map startup
      var myOptions = {
        zoom: 1,
        center: latlng,
        mapTypeControl: true,
        mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
        navigationControl: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	  geocoder = new google.maps.Geocoder();
      google.maps.event.addListener(map, 'click', function(){
           if(infowindow){
             infowindow.setMap(null);
             infowindow = null;
           }
      });
  });

{/* <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
        google.load("maps", "3",{other_params:"sensor=false&libraries=geometry"});
      </script>

<body style="margin:0px; padding:0px;" >
 <input id="address" value="Second Steet, New York" placeholder="Input Address"/>
 <select id="radius_km">
	 <option value=1>1km</option>
	 <option value=2>2km</option>
	 <option value=5>5km</option>
	 <option value=30>30km</option>
 </select>
 <button onClick="showCloseLocations()">Show Locations In Radius</button>
 <div id="map_canvas"  style="width:500px; height:300px;">
  // function showCloseLocations() {
  // 	var i;
  // 	var radius_km = $('#radius_km').val();
  // 	var address = $('#address').val();
  //
  // 	//remove all radii and markers from map before displaying new ones
  // 	if (radius_circle) {
  // 		radius_circle.setMap(null);
  // 		radius_circle = null;
  // 	}
  // 	for (i = 0; i < markers_on_map.length; i++) {
  // 		if (markers_on_map[i]) {
  // 			markers_on_map[i].setMap(null);
  // 			markers_on_map[i] = null;
  // 		}
  // 	}
  //
  // 	if (geocoder) {
  // 		geocoder.geocode({'address': address}, function (results, status) {
  // 			if (status == google.maps.GeocoderStatus.OK) {
  // 				if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
  // 					var address_lat_lng = results[0].geometry.location;
  // 					radius_circle = new google.maps.Circle({
  // 						center: address_lat_lng,
  // 						radius: radius_km * 1000,
  // 						clickable: false,
	// 					map: map
  // 					});
  //                   if (radius_circle) map.fitBounds(radius_circle.getBounds());
  // 					for (var j = 0; j < all_locations.length; j++) {
  // 						(function (location) {
  // 							var marker_lat_lng = new google.maps.LatLng(location.lat, location.lng);
  // 							var distance_from_location = google.maps.geometry.spherical.computeDistanceBetween(address_lat_lng, marker_lat_lng); //distance in meters between your location and the marker
  // 							if (distance_from_location <= radius_km * 1000) {
  // 								var new_marker = new google.maps.Marker({
  // 									position: marker_lat_lng,
  // 									map: map,
  // 									title: location.name
  // 								});      								google.maps.event.addListener(new_marker, 'click', function () {
  //                                   if(infowindow){
  //            infowindow.setMap(null);
  //            infowindow = null;
  //          }
  // 									infowindow = new google.maps.InfoWindow(
  //           { content: '<div style="color:red">'+location.name +'</div>' + " is " + distance_from_location + " meters from my location",
  //             size: new google.maps.Size(150,50),
  //             pixelOffset: new google.maps.Size(0, -30)
  //           , position: marker_lat_lng, map: map});
  // 								});
  // 								markers_on_map.push(new_marker);
  // 							}
  // 						})(all_locations[j]);
  // 					}
  // 				} else {
  // 					alert("No results found while geocoding!");
  // 				}
  // 			} else {
  // 				alert("Geocode was not successful: " + status);
  // 			}
  // 		});
  // 	}
  // }
