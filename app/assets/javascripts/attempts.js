$(document).ready(function() {

  var interval;
  var minutes       = 1;
  var questionCount = 0;
  var seconds       = 59;

  // Mark the current question as answered and hide it.
  // Unhide the next unanswered question.
  var changeQuestion = function() {
    nextUnansweredQuestion().addClass("answered hidden");
    nextUnansweredQuestion().removeClass("hidden");
  };

  // The next unanswered question to answer.
  var nextUnansweredQuestion = function() {
    return unansweredQuestions().first();
  };

  // Return unanswered questions.
  var unansweredQuestions = function() {
    return $(".quiz-question").not(".answered");
  }

  var answeredCurrentQuestion = function() {
    return $(".quiz-question").not(".answered").first().children(".quiz-answer").children("input").is(":checked");
  }

  // Handle submitting answers.
  $("#quiz-submit").click(function(e) {
    e.preventDefault();

    // Return if current question is not answered.
    if (!answeredCurrentQuestion()) {
      alert("You must choose an answer to proceed.");
      return;
    };

    // Increment progress.
    $("#progress-remaining").text(++questionCount);

    // Change question, change button label, or submit form.
    if (unansweredQuestions().size() > 2) {
      changeQuestion();
    } else if (unansweredQuestions().size() > 1) {
      $("#quiz-submit").text("Finish");
      changeQuestion();
    } else {
      $("form").submit();
    }

    // Scroll to top.
    $("html, body").animate({ scrollTop: 0 }, "slow");
  })

  // Handle adding/removing border from selected answers.
  $(".quiz-answer > label").click(function(e) {
    $(".quiz-answer > label").css("border", "5px solid white");
    $(this).css("border", "5px solid #FD9E28");
  })

  // Start countdown when button is selected.
  $("#quiz-start").click(function(e) {
    $(this).hide();
    $("#description").hide();
    $("form").removeClass("hidden");
    countdown("#countdown-remaining");
  })

  // Modified from: http://stackoverflow.com/questions/532553/javascript-countdown
  function countdown(element) {
    interval = setInterval(function() {
      var el = $(element);
      if(seconds < 0) {
        if(minutes == 0) {
          clearInterval(interval);
          alert("Your time is up! Submitting now...");
          $("form").submit();
          return;
        } else {
          minutes--;
          seconds = 59;
        }
      }

      if (minutes < 1) {
        if (seconds < 30) {
          $("#countdown-remaining").css("color", "#a94442");
        } else {
          $("#countdown-remaining").css("color", "#8a6d3b");
        }
      }

      if(minutes > 0) {
        var minute_text = minutes + ":";
      } else {
        var minute_text = ":";
      }
      var second_text = ("00" + seconds).slice(-2);

      el.text(minute_text + second_text);
      seconds--;
    }, 1000);
  }
})