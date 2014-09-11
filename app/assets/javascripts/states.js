function generateMap(response) {
  var $mapArea = $(".map-area");

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
              fill: "#450003"
            },
            label: "90% Republican"
          },
          {
            min: 10,
            max: 20,
            attrs: {
              fill: "#5C0002"
            },
            label: "80% Republican"
          },
          {
            min: 20,
            max: 30,
            attrs: {
              fill: "#94090D"
            },
            label: "70% Republican"
          },
          {
            min: 30,
            max: 40,
            attrs : {
              fill : "#D40D12"
            },
            label: "60% Republican"
          },
          {
            min: 40,
            max: 50,
            attrs: {
              fill: "#FF1D23"
            },
            label: "50% Republican"
          },
          {
            min: 51,
            max: 60,
            attrs: {
              fill: "#7ABAF2"
            },
            label: "50% Democrat"
          },
          {
            min: 60,
            max: 70,
            attrs: {
              fill: "#7ABAF2"
            },
            label: "60% Democrat"
          },
          {
            min: 70,
            max: 80,
            attrs: {
              fill: "#0074D9"
            },
            label: "70% Democrat"
          },
          {
            min: 80,
            max: 90,
            attrs: {
              fill: "#004B8D"
            },
            label: "80% Democrat"
          },
          {
            min: 90,
            attrs: {
              fill: "#00305A"
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
    var name = states[i].name,
        independents = "",
        politicalLeaning = Math.round(states[i].political_leaning),
        politicalLeaningDisplay = "<p>" + Math.round(states[i].political_leaning) + "% Democrat</p>";

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

