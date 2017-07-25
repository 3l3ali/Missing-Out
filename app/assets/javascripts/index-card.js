$(document).ready(function () {
    $('.card-info').click(function(e){
      $('.card-show').removeClass('hidden');
      $('.card-details').addClass('hidden');
      //debugger;
      // $( ".stufftoshow" ).removeClass("hidden")
      // $(e).find('stufftoshow').removeClass('hidden')
      $('#card-holder-'+$(e.currentTarget).attr('data-id')).addClass('hidden');
      $('#card-full-info-'+$(e.currentTarget).attr('data-id')).removeClass('hidden');
      window.scrollTo(0, 100);
    });
    $('.close-btn').click(function(){
      $('.card-details').addClass('hidden');
      $('.card-show').removeClass('hidden');
    });
  });
