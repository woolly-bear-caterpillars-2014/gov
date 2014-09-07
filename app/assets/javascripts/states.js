function generate_map() {
  var $mapArea = $(".map-area");

  $mapArea.mapael({
    map: {
      name: "usa_states",
      zoom: {
        enabled: true
      },
      defaultArea: {
        attrs: {
          fill: "#424342",
          stroke: "#F5F2EB",
          cursor: "pointer"
        },
        attrsHover: {
          animDuration: 100,
          fill: "#88A6AF"
        },
        text: {
          attrs: {
            cursor: "pointer",
              "font-size": 10,
            fill: "#000"
          },
          attrsHover: {
            animDuration: 0
          }
        },
        eventHandlers: {
          click: function (e, id, mapElem, textElem) {
            window.location.href = "/states/" + id;
          }
        }
      }
    },
    areas: {
        "CA": {
          href : "#",
          tooltip: {content : "<span style=\"font-weight:bold;\">Nord (59)</span><br />Population : 2617939"}
        },
        "FL": {
          value: "2268265",
          href : "#",
          tooltip: {content : "<span style=\"font-weight:bold;\">Paris (75)</span><br />Population : 2268265"}
        }
      }
  })
}


function generate_areas() {

  // var $form = $('form');

  // $form.on('submit', function(e) {
  //   e.preventDefault();

  //   $.ajax('/maps', {
  //     type: 'GET',
  //     dataType: 'json',
  //     data: $form.serialize()
  //   }).done(function(response) {
  //     console.log(response)
  //   })
  // });


  // states = [
  //   "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID",
  //   "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS",
  //   "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK",
  //   "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV",
  //   "WI", "WY"
  // ]

}
