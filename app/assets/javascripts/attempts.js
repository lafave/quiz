$(document).ready(function() {
  $("#quiz-submit").click(function(e) {
    unanswered_questions = $(".quiz-question").not(".answered")

    if (unanswered_questions.size() > 2) {
      // Many questions remaining
      e.preventDefault();
      unanswered_questions.first().addClass("answered hidden");
      $(".quiz-question").not(".answered").first().removeClass("hidden");
    } else if (unanswered_questions.size() > 1) {
      // One question remaining
      e.preventDefault();
      $("#quiz-submit").text("Complete");
      unanswered_questions.first().addClass("answered hidden");
      $(".quiz-question").not(".answered").first().removeClass("hidden");
    } else {
      // No questions remaining
    }
  })
})