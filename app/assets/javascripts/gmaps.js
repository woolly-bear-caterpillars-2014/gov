function generateTweetMap() {
  map = void 0;

  var styleArray = [{featureType:"water",elementType:"geometry",stylers:[{"color":"#193341"}]},{featureType:"landscape",elementType:"geometry",stylers:[{"color":"#2c5a71"}]},{featureType:"road",elementType:"geometry",stylers:[{"color":"#29768a"},{"lightness":-37}]},{featureType:"poi",elementType:"geometry",stylers:[{"color":"#406d80"}]},{featureType:"transit",elementType:"geometry",stylers:[{"color":"#406d80"}]},{elementType:"labels.text.stroke",stylers:[{"visibility":"on"},{"color":"#3e606f"},{"weight":2},{"gamma":0.84}]},{elementType:"labels.text.fill",stylers:[{"color":"#ffffff"}]},{featureType:"administrative",elementType:"geometry",stylers:[{"weight":0.6},{"color":"#1a3541"}]},{elementType:"labels.icon",stylers:[{"visibility":"off"}]},{featureType:"poi.park",elementType:"geometry",stylers:[{"color":"#2c5a71"}]}];

  $(document).ready(function() {
    var mapOptions;
    mapOptions = void 0;
    mapOptions = {
      zoom: 5,
    center: new google.maps.LatLng(38.850033, -95.6500523),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDefaultUI: false,
    disableDoubleClickZoom: false,
    zoomControl: true,
    styles: styleArray
    };
    return map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  });

  var infoWindow = new google.maps.InfoWindow;

  $(function() {
    return setInterval(retrieveTweets, 2000);
  });

  retrieveTweets = function() {
    return $.getJSON("/data/data.json", function(data) {
      return $.each(data, function(key, val) {
        var lat, latlng, lng, marker, text;
        lat = data.geo.coordinates[0];
        lng = data.geo.coordinates[1];
        text = data.text;
        username = data.user.screen_name;
        latlng = new google.maps.LatLng(lat, lng);
        marker = new google.maps.Marker({
          position: latlng,
          icon: 'tweet1.png',
          animation: google.maps.Animation.DROP,
          draggable: false,
          title: text
        });

        var onMarkerClick = function() {
          var marker = this;
           infoWindow.setContent('Tweet: <b>' + text + '</b><br>' + '<a href="http://twitter.com/' + username + '" target="_blank">' + username + '</a>');
           infoWindow.open(map, marker);
         };

        google.maps.event.addListener(marker, 'click', onMarkerClick);
        
        return marker.setMap(map);

        google.maps.event.addListener(map, 'click', function() {
               infoWindow.close();
             });
        $('.tweet-sidebar').append(text);
      });
    });
  };
};
