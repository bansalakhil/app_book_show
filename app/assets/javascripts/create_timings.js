function add_timings() {
  count = $('#timings .show_times').length;
  $('#timings').append('<tr class="show_times"><td><input name="timings[' + count + '][start_time]" type="text" /></td><td><input name="timings[' + count + '][end_time]" type="text" /></td><td><i class="icon-remove remove_time_pairs"></i></td></tr>');
}
$('.remove_time_pairs').live('click', function() {
  $(this).closest('.show_times').remove();
});