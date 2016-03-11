$(document).ready(function() {
	$("#question-comments").hide();
	$("#show-comment-form").on("click", function(event){
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
		
	});
});