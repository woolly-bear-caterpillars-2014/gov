$(document).ready(function() {
  $(".maparea3").mapael({
    map: {
      name: "usa_states",
      zoom: {
        enabled: true
      },
      defaultArea: {
        attrs: {
          fill: "#5ba4ff",
          stroke: "#99c7ff",
          cursor: "pointer"
        },
        attrsHover: {
          animDuration: 0
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
    }
  });
});
