$(document).ready(function() {
	$("#question-comments").hide();
	$(".answer-comments").hide();
	$("#show-question-comment-form").on("click", function(event){
		event.preventDefault();
		if($("#question-comments").is(":visible")){
                $("#question-comments").hide();
            } else {
                $("#question-comments").show();
            }
            // return false;
	});

	$("#question-comments").on("submit", function(event){
		event.preventDefault();
		var $form = $(this);
		var route = $form.attr('action');
		var data = $form.serialize();
		var request = $.ajax({
	      url: route,
	      method: "post",
	      data: data
	    })

	    request.done(function (comment) {
			var commentBody = comment.body
			var username = comment.username
			var comment = "<p class='com'>" + commentBody + " by " + username + "</p>"
			$("#question-comments-container").prepend(comment);
	    })
	});

// COMMENTS JQUERY STUFF	

	$(".show-answer-comment-form").on("click", function(event){
		event.preventDefault();
		var currentForm = $(this).parent();
		var id = $("span:first", currentForm).text();
		if($("#answer-comments-" + id).is(":visible")){
                $("#answer-comments-" + id).hide();
            } else {
                $("#answer-comments-" + id).show();
            }
            // return false;
	});

	$(".answer-comments").on("submit", function(event){
		event.preventDefault();
		var $form = $(this);
		var route = $form.attr('action');
		var data = $form.serialize();
		var request = $.ajax({
	      url: route,
	      method: "post",
	      data: data
	    })

	    request.done(function (comment) {
			var commentBody = comment.body
			var username = comment.username
			var id = comment.id
			var comment = "<p class='com'>" + commentBody + " by " + username + "</p>"
			$("#answer-comments-container-" + id).prepend(comment);
	    })
	});
});