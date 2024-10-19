// Custom Error Banner Pop Up

 // Function to update the error count and error elements
 function updateErrorCount() {
    // Count the existing validation errors
    var errors = $("#submitform").validate().numberOfInvalids();

    // Manually check if reCAPTCHA is valid and add to errors if not
    if (grecaptcha.getResponse() == "") {
        if (!$('#recaptcha-error').length) {
            $('.g-recaptcha').addClass('errors');
            $('#recaptcha').css({
                'border': '2px solid #ff8b8b',
                'box-shadow': '0 -1px 1px #ff8b8b'
            });
        }
    } else {
        $('#recaptcha-error').remove();
        $('.g-recaptcha').removeClass('errors');
        $('#recaptcha').css({
            'border': '',
            'box-shadow': ''
        });
    }

    // Count elements with the "errors" class, including reCAPTCHA
    var customErrorElements = $(".errors").length;

    // Total error count
    var totalErrors = errors + customErrorElements;

    // Update error count in the parent document
    $(window.parent.document).find('#errorCount').text(totalErrors);
    $(window.parent.document).find('#errorText').text(totalErrors === 1 ? 'error' : 'errors');
    $(window.parent.document).find('#errorText2').text(totalErrors === 1 ? 'Error' : 'Errors');

    return totalErrors;
}

// Function to handle form validation and error display on submit
function invalidHandler(event, validator) {
    var totalErrors = updateErrorCount();

    // Show or hide the error banner based on total errors
    if (totalErrors) {
        $(window.parent.document).find('#errorBanner').removeClass('hidden');
    } else {
        $(window.parent.document).find('#errorBanner').addClass('hidden');
    }
}


// Form submission
$("#submitform").submit(function (event) {
    if (!$(this).valid() || grecaptcha.getResponse() == "") {
        event.preventDefault(); // Prevent form submission if invalid or reCAPTCHA is not completed
        invalidHandler(event, $(this).validate());
    } else {
        $('.load_holder').css('display', 'block');
        self.parent.$('html, body').animate(
            { scrollTop: self.parent.$('#myframe').offset().top },
            500
        );
    }
});

// Handle keypress and change events to dynamically update error count and remove inline styles
$("input, select, textarea").on("keyup change", function (event) {
    var $this = $(this);
    if ($this.hasClass("valid")) {
        $this.removeClass("active-error");
    }

    // If the "errors" class is removed, re-evaluate the error count
    setTimeout(function() {
        updateErrorCount();
    }, 0);
});



var currentErrorIndex = 0;
var viewedErrors = [];

  // Handle click event for scrolling to errors
  $(window.parent.document).find('#scrollToError').click(function () {
    var errorElements = $(".error, .errors").not("label.error").not("input[type=hidden].error").not("input[type=radio].error").not("input[type=checkbox].error").add(".chkbox_req").add(".privacy_req");
    var radioErrorElements = $("input[type=radio].error").closest('td');

    var combinedErrors = $.merge(errorElements.toArray(), radioErrorElements.toArray());
    combinedErrors.sort(function (a, b) {
        return $(a).offset().top - $(b).offset().top;
    });

    if (combinedErrors.length) {
        // Remove styles from reCAPTCHA before moving to the next error
        $('#recaptcha iframe').css({
            'border': '',
            'box-shadow': ''
        });

        // Check if all errors have been viewed
        if (viewedErrors.length >= combinedErrors.length) {
            viewedErrors = []; // Reset after all errors have been viewed
            currentErrorIndex = 0;
        }

        var targetElement = $(combinedErrors[currentErrorIndex]);

        // Add the current error to the viewed list if not already viewed
        if (!viewedErrors.includes(currentErrorIndex)) {
            viewedErrors.push(currentErrorIndex);
        }

        // Remove the active class from all error elements
        $(combinedErrors).removeClass('active-error');

        // Add the active class to the current target element
        targetElement.addClass('active-error');

        // Check if targetElement is the reCAPTCHA container and add inline styles to #recaptcha
        if (targetElement.hasClass('g-recaptcha')) {
            $('#recaptcha iframe').css({
                'border': '4px solid #ff8b8b',
                'box-shadow': '0 -1px 1px #ff8b8b'
            });
        }

        $('html, body').animate({
            scrollTop: targetElement.offset().top - 50
        }, 500);

        currentErrorIndex++;

        // Reset the index if it exceeds the number of error elements
        if (currentErrorIndex >= combinedErrors.length) {
            currentErrorIndex = 0;
        }
    }
});
