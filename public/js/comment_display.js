$(document).ready(function() {
  $(".comment").hide();
  $(".question").on("click", function(event){
    $(".comment").toggle();
  });
});
