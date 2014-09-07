function generateMap(response) {
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
    legend: {
      area: {
        display: true,
        title:"Political Leaning",
        slices: [
          {
            max: 10,
            attrs: {
              fill: "#67001f"
            },
            label: "90% Republican"
          },
          {
            min: 10,
            max: 20,
            attrs: {
              fill: "#b2182b"
            },
            label: "80% Republican"
          },
          {
            min: 20,
            max: 30,
            attrs: {
              fill: "#d6604d"
            },
            label: "70% Republican"
          },
          {
            min: 30,
            max: 40,
            attrs : {
              fill : "#f4a582"
            },
            label: "60% Republican"
          },
          {
            min: 40,
            max: 50,
            attrs: {
              fill: "#fddbc7"
            },
            label: "50% Republican"
          },
          {
            min: 50,
            max: 60,
            attrs: {
              fill: "#d1e5f0"
            },
            label: "Between 100 000 and 500 000 inhabitants"
          },
          {
            min: 60,
            max: 70,
            attrs: {
              fill: "#92c5de"
            },
            label: "Between 500 000 and 1 000 000 inhabitants"
          },
          {
            min: 70,
            max: 80,
            attrs: {
              fill: "#4393c3"
            },
            label: "Between 500 000 and 1 000 000 inhabitants"
          },
          {
            min: 80,
            max: 90,
            attrs: {
              fill: "#2166ac"
            },
            label: "More than 1 million inhabitants"
          },
          {
            min: 90,
            attrs: {
              fill: "#053061"
            },
            label: "More than 1 million inhabitants"
          }
        ]
      }
    },
    areas: colorizeStates(response)
  })
}

function getRepubDemCount() {
  $.ajax('/states', {
    type: 'GET',
    dataType: 'json'
  }).done(function(response) {
    generateMap(response);
  })
}


function colorizeStates(states) {
  var areas = {};

  for (var i = 0; i < states.length; i++) {
    var name = states[i].name;

    areas[name] = {
      value: states[i].political_leaning,
      tooltip: {
        content : "<span style=\"font-weight:bold;\">" + name + "</span><br>" +
        "<p>" + states[i].democrat_count + " Democrats</p>" +
        "<p>" + states[i].republican_count + " Republicans</p>" +
        "<p>" + Math.round(states[i].political_leaning) + "%</p>"
      }
    }
  }

  return areas
}
