$(document).ready(function() {
  $(".maparea3").mapael({
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
    }
  });
});
