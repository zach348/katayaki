$(document).ready(function(){
  setTimeout(updateVotes, 200);

  $('.voteButton').on('click', function(event) {
    setTimeout(updateVotes, 100);
  });
});


var updateVotes = function() {
  var ratingElements = $(".rating");
  ratingElements.each(function(index){
    var rating = ratingElements[index];
    var rating_id = rating.getAttribute('id');
    $.ajax({
      url: '/votes/' + rating_id,
      contentType: 'application/json'
    })
    .done(function(total) {
      rating.innerHTML = total;
    });
  });
};
