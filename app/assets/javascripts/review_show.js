$(document).ready(function () {
    $('#myReviews li div').hide();
    size_li = $("#myReviews li div").size();
    x=9;
    $('#myReviews li div:lt('+x+')').show();
    $('#loadMore').click(function () {
        console.log("aheeeyy");
        x= (x+9 <= size_li) ? x+9 : size_li;
        $('#myReviews li div:lt('+x+')').show();
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
