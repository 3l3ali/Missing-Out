$(document).ready(function () {
    $('#myReviews li').hide();
    size_li = $("#myReviews li").size();
    x=2;
    $('#myReviews li:lt('+x+')').show();
    $('#loadMore').click(function () {
        console.log("heeeyy");
        x= (x+5 <= size_li) ? x+5 : size_li;
        $('#myReviews li:lt('+x+')').show();
            if (size_li == x)
            {
              $('#loadMore').hide();
            }
    });




      $('#reviewForm').hide();
      $('#addReview').click(function () {
        $('#reviewForm').toggle();
        text = "Add A review"
      if ($('#addReview').text() == text)
      {
        $("#addReview").html("Hide");
      } else {
        $("#addReview").html("Add A review");
      }



    });
});
