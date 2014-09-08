function generateTweetMap(){
  map = void 0;

  var styleArray = [{featureType:"water",elementType:"geometry",stylers:[{"color":"#193341"}]},{featureType:"landscape",elementType:"geometry",stylers:[{"color":"#2c5a71"}]},{featureType:"road",elementType:"geometry",stylers:[{"color":"#29768a"},{"lightness":-37}]},{featureType:"poi",elementType:"geometry",stylers:[{"color":"#406d80"}]},{featureType:"transit",elementType:"geometry",stylers:[{"color":"#406d80"}]},{elementType:"labels.text.stroke",stylers:[{"visibility":"on"},{"color":"#3e606f"},{"weight":2},{"gamma":0.84}]},{elementType:"labels.text.fill",stylers:[{"color":"#ffffff"}]},{featureType:"administrative",elementType:"geometry",stylers:[{"weight":0.6},{"color":"#1a3541"}]},{elementType:"labels.icon",stylers:[{"visibility":"off"}]},{featureType:"poi.park",elementType:"geometry",stylers:[{"color":"#2c5a71"}]}];

  $(document).ready(function() {
    var mapOptions;
    mapOptions = void 0;
    mapOptions = {
      zoom: 4,
      center: new google.maps.LatLng(41.850033, -87.6500523),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      disableDefaultUI: false,
      disableDoubleClickZoom: false,
      zoomControl: true,
      styles: styleArray
    };
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  });

  $(function() {
    setInterval(retrieveTweets, 1000);
  });

  retrieveTweets = function() {
    console.log("retrieving");
    $.getJSON("/data/data.json", function(data) {
      $.each(data, function(key, val) {
        var lat, latlng, lng, marker, text, username;
        lat = data.geo.coordinates[0];
        lng = data.geo.coordinates[1];
        text = data.text;
        username = data.user.screen_name;
        latlng = new google.maps.LatLng(lat, lng);
        marker = new google.maps.Marker({
          position: latlng,
          icon: 'tweet.png',
          animation: google.maps.Animation.DROP,
          draggable: false,
          title: text
        });
        var infowindow = new google.maps.InfoWindow({
            content: 'Tweet: <b>' + text + '</b><br>' + username
        });
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
          });
        marker.setMap(map);
      });
    });
  };
};
