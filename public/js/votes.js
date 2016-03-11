$(document).ready(function() {
	$(".upvote").on("click", function(event){
		event.preventDefault();
		var $upvote = $(this);
		var route = $upvote.attr("href");
		var request = $.ajax({
			url: route,
			method: "GET"
		});
		request.done(function (votes) {
	      $upvote.css("color", "green")
	      $upvote.parent().parent().find(".vote-count").text("Votes: " + votes)
	    });
	});

	$(".downvote").on("click", function(event){
		event.preventDefault();
		var $downvote = $(this);
		var route = $downvote.attr("href");
		var request = $.ajax({
			url: route,
			method: "GET"
		});
		request.done(function (votes) {
	      $downvote.css("color", "red")
	      $downvote.parent().parent().find(".vote-count").text("Votes: " + votes)
	    });
	});
});