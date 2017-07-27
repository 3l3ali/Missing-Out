$(document).ready(function () {
  var state = 'closed';

  $('.filter').click(function(e){
    if(state === 'closed') {
      $('#toggleFilter').removeClass('hidden');
      $('.filter').addClass('close-action');
      state = 'opened';
    } else {
      $('.filter').removeClass('close-action');
      $('#toggleFilter').addClass('hidden');
      state = 'closed';
    }
  });
});
