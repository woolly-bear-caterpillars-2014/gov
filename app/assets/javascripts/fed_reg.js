$(document).ready(function() {
  // TESTING AJAX


  // $.ajaxSetup({
  //   headers: {
  //     'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  //   }
  // });

  // var $form = $('form');

  // $form.on('submit', function(e) {
  //   e.preventDefault();

  //   $.ajax('/fedregs', {
  //     type: 'POST',
  //     dataType: 'html',
  //     data: $form.serialize()
  //   }).done(function(response) {
  //     // console.log(response);
  //     // historyData = parseClosingData(response.pastStockData);
  //     // console.log(historyData);
  //     // renderGraph(historyData);
  //     // console.log(historyData);
  //     // html = injectBillHTML(response.data.table);

  //     $('.frame').html(response)
  //   })
  // });


  // function injectBillHTML(data) {
  //     '<ul class="slidee">'
  //     <% @result_set.each do |data| %>
  //       '<li>'
  //         <h1><a href="<%= data.attributes["public_inspection_pdf_url"] %>">
  //           <%= data.title %>
  //         </a></h1>
  //         <% data.agencies.each do |agency| %>
  //           <p><a href="<%= agency.url %>">
  //             <%= agency.name %>
  //           </a></p>
  //         <% end %>
  //         '<p align="justify">'<%= data.abstract %>'</p>'
  //         '<p>'<%= data.type %>'</p>'
  //         '<p>'<%= data.publication_date %>'</p>'
  //       '</li>'
  //     <% end %>
  //   </ul>


  // }
});

