$(document).ready(function() {
  $('.seats').click(function() {
    total = 0
    $('.seats:checked').each(function() {
      total = total + (+($(this).attr('price')));
    });
    $('#total_price').text(total);
  });
  $('#book').click(function(event){
    if($('.seats:checked').length) {	
      if(!confirm(("Are You Sure you want to book seats? This order will cost Rs." + $('#total_price').text()))) {
        event.preventDefault();
      }
    } else {
      alert("You have not selected any seat.")
      event.preventDefault();
    }
  });
});