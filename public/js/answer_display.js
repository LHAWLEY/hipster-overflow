$(document).ready(function() {
  $('.answer-form').hide();
    $(".answer_button").on("click", function() {
    $(this).hide();
    $('.answer-form').show();
    $('.com').hide();
  });

  $(".answer-form").on("submit", function(event) {
    event.preventDefault();


  //   var comment_text = $("#answer").val();

    var $form = $(this)
    var data = $form.serialize()
    var route = $form.attr("action");

    var request = $.ajax({
      url: route,
      method: "post",
      data: data
    })

    request.done(function (postComment) {
    $(".answer-container").append(postComment)


    $(this).hide();
    $(".answer_button").show();
    $('.com').show();
    })

  });
});
