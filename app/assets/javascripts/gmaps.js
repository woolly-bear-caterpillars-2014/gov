  function generateTweetMap(){
  map = void 0;
  console.log('set map');

  $(document).ready(function() {
    var mapOptions;
    mapOptions = void 0;
    mapOptions = {
      zoom: 3,
      center: new google.maps.LatLng(30.297018, 0.851440),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      zoomControl: true
    };
    return map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  });

  $(function() {
    return setInterval(retrieveTweets, 1000);
  });

  retrieveTweets = function() {
    console.log("retrieving");
    return $.getJSON("/data/data.json", function(data) {
      return $.each(data, function(key, val) {
        var lat, latlng, lng, marker, text;
        console.log(data);
        console.log(data.geo);
        lat = data.geo.coordinates[0];
        lng = data.geo.coordinates[1];
        text = data.text;
        latlng = new google.maps.LatLng(lat, lng);
        marker = new google.maps.Marker({
          position: latlng,
          icon: 'http://maps.google.com/mapfiles/kml/pal4/icon47.png',
          title: text
        });
        return marker.setMap(map);
        $('.tweet-sidebar').append(text);
      });
    });
  };
};