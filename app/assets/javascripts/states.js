function generateMap(response) {
  var $mapArea = $(".map-area");
  console.log(response);
  $mapArea.mapael({
    map: {
      name: "usa_states",
      zoom: {
        enabled: false
      },
      defaultArea: {
        attrs: {
          fill: "#D7D7D7",
          stroke: "#fff",
          cursor: "pointer"
        },
        attrsHover: {
          animDuration: 100,
          fill: "#38B25A"
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
        display: false,
        title:"Political Leaning",
        slices: [
          {
            max: 10,
            attrs: {
              fill: "#7F2626"
            },
            label: "90% Republican"
          },
          {
            min: 10,
            max: 20,
            attrs: {
              fill: "#7F0000"
            },
            label: "80% Republican"
          },
          {
            min: 20,
            max: 30,
            attrs: {
              fill: "#CC0000"
            },
            label: "70% Republican"
          },
          {
            min: 30,
            max: 40,
            attrs : {
              fill : "#FF0000"
            },
            label: "60% Republican"
          },
          {
            min: 40,
            max: 50,
            attrs: {
              fill: "#FF4C4C"
            },
            label: "50% Republican"
          },
          {
            min: 51,
            max: 60,
            attrs: {
              fill: "#3059FF"
            },
            label: "50% Democrat"
          },
          {
            min: 60,
            max: 70,
            attrs: {
              fill: "#2B26FF"
            },
            label: "60% Democrat"
          },
          {
            min: 70,
            max: 80,
            attrs: {
              fill: "#0003D6"
            },
            label: "70% Democrat"
          },
          {
            min: 80,
            max: 90,
            attrs: {
              fill: "#0F2096"
            },
            label: "80% Democrat"
          },
          {
            min: 90,
            attrs: {
              fill: "#020570"
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
