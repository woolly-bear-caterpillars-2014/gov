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
    legend : {
      area : {
        display : true,
        title :"Political Leaning",
        slices : [
          {
            max: -5,
            attrs : {
              fill : "#6B0C22"
            },
            label :"Less than de 300 000 inhabitants"
          },
          {
            min: -5,
            max: -1,
            attrs : {
              fill : "#D9042B"
            },
            label :"Between 100 000 and 500 000 inhabitants"
          },
          {
            min: -1,
            max: 2,
            attrs : {
              fill : "#FFF"
            },
            label :"Between 500 000 and 1 000 000 inhabitants"
          },
          {
            min :2,
            max :6,
            attrs : {
              fill : "#588C8C"
            },
            label :"More than 1 million inhabitants"
          },
          {
            min: 6,
            attrs : {
              fill : "#00314C"
            },
            label :"More than 1 million inhabitants"
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

function stateNames(response) {
  var states = [];

  for (var i = 0; i < response.states.length; i++) {
    var name = response.states[i].abbreviation;
    var democratCount = response.democrats[i].length;
    var republicanCount = response.republicans[i].length;
    var politicalLeaning = democratCount - republicanCount;

    states[i] = {
      'name': name,
      'politicalLeaning': politicalLeaning
    }
  }

  return states
}

function colorizeStates(response) {
  console.log(response)
  var states = stateNames(response);
  var areas = {};

  for (var i = 0; i < response.states.length; i++) {
    var name = states[i].name;
    areas[name] = {
      value: states[i].politicalLeaning,
      tooltip: {
        content : "<span style=\"font-weight:bold;\">" + name + "</span><br>" +
        "<p>" + states[i].politicalLeaning + "</p>"
      }
    }
  }

  return areas
}

