function generateMap(response) {
  var $mapArea = $(".map-area");
  console.log(response);
  $mapArea.mapael({
    map: {
      name: "usa_states",
      zoom: {
        enabled: true
      },
      defaultArea: {
        attrs: {
          fill: "#F5F5BD",
          stroke: "#fff",
          cursor: "pointer"
        },
        attrsHover: {
          animDuration: 100,
          fill: "#ddd"
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
            min: 51,
            max: 60,
            attrs: {
              fill: "#d1e5f0"
            },
            label: "50% Democrat"
          },
          {
            min: 60,
            max: 70,
            attrs: {
              fill: "#92c5de"
            },
            label: "60% Democrat"
          },
          {
            min: 70,
            max: 80,
            attrs: {
              fill: "#4393c3"
            },
            label: "70% Democrat"
          },
          {
            min: 80,
            max: 90,
            attrs: {
              fill: "#2166ac"
            },
            label: "80% Democrat"
          },
          {
            min: 90,
            attrs: {
              fill: "#053061"
            },
            label: "90% Democrat"
          }
        ]
      }
    },
    areas: colorizeStates(response)
  })
}

function getRepubDemCount() {
  console.log("Hello from getRepubDemCount");
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
    var independents = ""
    var politicalLeaning = Math.round(states[i].political_leaning);
    var politicalLeaningDisplay = "<p>" + Math.round(states[i].political_leaning) + "% Democrat</p>";


    if (politicalLeaning < 50) {
      politicalLeaning = 100 - politicalLeaning;
      politicalLeaningDisplay = "<p>" + politicalLeaning + "% Republican</p>"
    }

    if (states[i].independent_count) {
      independents = "<p>Independents: <b>" + states[i].independent_count + "</b></p>";
    }

    areas[name] = {
      value: states[i].political_leaning,
      tooltip: {
        content : "<span style=\"font-weight:bold;\">" + name + "</span><br>" +
        "<p>Democrats: <b>" + states[i].democrat_count + "</b></p>" +
        "<p>Republicans: <b>" + states[i].republican_count + "</b></p>" +
        independents +
        politicalLeaningDisplay
      }
    }
  }

  return areas
}