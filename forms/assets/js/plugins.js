$(document).ready(function () {

  $('.rclose').on('click', function (event) {


    // Move all labels up
    $('.group .form_label label').each(function () {
      let label = $(this);
      let input = label.closest('.group').find('.form_field');

      // Check if the input is NOT a radio button, select, or readonly text input
      if (!input.is('input[type="radio"], select, input[type="text"][readonly]')) {
    
        moveLabelUp(label);
      }
    });
  });

 // Add click event to the disclaimer to toggle the checkbox
 $(".disclaimer").click(function(event) {
  // Check if the click was not on any input element inside the disclaimer
  if (!$(event.target).is('input[type="checkbox"]')) {
      var checkbox = $(this).find('input[type="checkbox"]');
      checkbox.prop("checked", !checkbox.prop("checked")).trigger("change");
  }
});


  /*Auto-height refresh*/

  function adjustIframeHeight() {
    const iframe = parent.document.getElementById('myframe');
    if (iframe) {
      let lastHeight = 0;
      const interval = setInterval(() => {
        const newHeight = iframe.contentWindow.document.body.scrollHeight;
        if (newHeight !== lastHeight) {
          iframe.style.height = (newHeight + 100) + 'px';
          lastHeight = newHeight;
        }
      }, 300); // Adjust interval (in ms) as needed
    }
  }

  // Initial call on page load (assuming the iframe content loads quickly)
  adjustIframeHeight();

  // Add an event listener inside the iframe for content changes
  // (This is needed if the content changes dynamically, e.g., AJAX calls)
  window.addEventListener('resize', adjustIframeHeight);


  $('.clockpicker').clockpicker()
    .find('input').change(function () {
      let input = $(this);
      let label = input.closest('.group').find('.form_label label');
      if (input.val().trim() !== '') { // If the input has a value
      
        moveLabelUp(label);
 // Keep the label moved up
      } else {
        moveLabelCenter(label, input); // Move the label back down if empty
      }
    });



  $('.toggle-labels').click(function () {
    let labelState = $(this).data('labelState') || 'down';

    $('.group .form_label label').each(function () {
      let label = $(this);
      let input = label.closest('.group').find('.form_field');

      // Check if the input is NOT a radio button or select
      if (input.is('input[type="text"], textarea') && !input.is('input[type="radio"], select, input[type="text"][readonly]')) {
        if (labelState === 'down') {
          input.attr('placeholder', input.data('original-placeholder'));
          let containerWidth = label.parent().outerWidth();
          moveLabelUp(label);
  
        } else {
          input.data('original-placeholder', input.attr('placeholder'));
          input.attr('placeholder', '');
          moveLabelCenter(label, input);
        }
      }
    });

    // Toggle the state for the next click
    $(this).data('labelState', labelState === 'down' ? 'up' : 'down');
  });


  $('.toggle-labels').click(function () {

    $(this).find('i').toggleClass('fa-eye-slash');
  });
  function adjustAnimatedClassHeight() {
    $('.field_holder.animated_box textarea').each(function () {
      let textarea = $(this);
      let animatedClass = textarea.next('.animated_class');

      // Calculate the total height of the textarea content
      let contentHeight = textarea.prop('scrollHeight'); // Get height of content, including overflow

      let totalHeight = contentHeight /* + paddingHeight + borderHeight */;

      // Set the height of the animated_class span
      animatedClass.css('height', '100px');
    });
  }

  // Initial adjustment on page load
  adjustAnimatedClassHeight();

  // Adjust on input and focus (to handle resizing)
  $('.field_holder.animated_box textarea').on('input focus', adjustAnimatedClassHeight);


/*   function checkAndUpdateLabel(input) {
    let label = input.closest('.group').find('.form_label label');

    if (input.is('input[type="text"], textarea')) {
      if (input.val().trim() !== '') { // Check if value is not empty (due to autofill)
        moveLabelUp(label);
        input.attr('placeholder', '');
      }
    }
  } */


  function moveLabelUp(label) {


    let containerWidth = label.parent().outerWidth();

    if (!label.data('original-html')) {
      label.data('original-html', label.html());
  }

  const originalHtml = label.data('original-html').trim();
  const originalText = label.contents().filter(function() {
      return this.nodeType === 3; // Filter for text nodes only
  }).text().trim();

  // Use a constant charWidth of 16
  const charWidth = 16;

  // Calculate maxLength using the constant charWidth
  const maxLength = Math.floor((containerWidth / charWidth) * 1.75);
  console.log('ContainerWidth:', containerWidth);
  console.log('CharWidth (constant):', charWidth);
  console.log('MaxLength:', maxLength);

  // Truncate the label text if it exceeds the calculated maxLength
  let truncatedText = originalText;
  if (originalText.length > maxLength) {
      truncatedText = originalText.substr(0, maxLength) + '…';
  }

  // Replace the original text content while preserving the HTML
  label.html(label.html().replace(originalText, truncatedText));

   

    if ($(window).width() <= 360) {
      // Reset top position without other style changes
      label.css({
        'position': 'unset',
        'top': '-5px',
        'font-size': '15px',
        'color': '#495057'
      });
    } else {
      label.css({
        'top': '-5px',
        'font-size': '15px',
        'color': '#495057'
      });
    }

  }


  // Function to move labels back to center (common for all input types)
  function moveLabelCenter(label, input) {

    if (label.data('original-html')) {
      label.html(label.data('original-html'));
  }

  if (input.is('textarea')) { // Special handling for textarea padding
    // Calculate the total height of the textarea, including padding and borders
    const textareaHeight = input.outerHeight();
    const labelHeight = label.outerHeight(); // Get the label's current height

    // Calculate the top position by considering the textarea's padding, height, and the label's height
    labelTop = parseInt(input.css('padding-top'), 10) + ((textareaHeight - labelHeight) / 2);
}else {
      labelTop = (input.outerHeight() - label.outerHeight());
    }
    let labelLeft = parseInt(input.css('padding-left'), 10);
    if (!label.closest('.form_box .group').is(':first-child')) {

      labelLeft += 10; // Add 33px to the left padding
    }
    input.attr('placeholder', '');
    if ($(window).width() <= 360) {
      label.css({
        'position': 'absolute',
        'top': labelTop + 'px',
        'font-size': 'inherit',
        'color': 'inherit',

      });
    } else {
      label.css({
        'top': labelTop + 'px',
        'font-size': 'inherit',
        'color': 'inherit',

      });
    }

  }



  function checkAndUpdateLabelPosition() {
    $('.group .form_label label').each(function () {
      let label = $(this);
      let input = label.closest('.group').find('.form_field');


      let labelTop;
      if (input.is('textarea')) { // Special handling for textarea padding
        // Calculate the total height of the textarea, including padding and borders
        const textareaHeight = input.outerHeight();
        const labelHeight = label.outerHeight(); // Get the label's current height
    
        // Calculate the top position by considering the textarea's padding, height, and the label's height
        labelTop = parseInt(input.css('padding-top'), 10) + ((textareaHeight - labelHeight) / 2);
    } else {
        labelTop = (input.outerHeight() - label.outerHeight());
      }
      // Check if label is a child of the first form_box group
      input.attr('placeholder', input.data('original-placeholder'));

      if ($(window).width() <= 500) {
        // Reset top position without other style changes

        label.css({
          'position': 'unset',
          'top': '-5px',
          'font-size': '15px',
          'color': '#495057'
        });
      } else {
        let labelLeft = parseInt(input.css('padding-left'), 10);
        // Check if label is NOT a child of the first form_box group
        if ($(window).width() > 780) {
          if (!label.closest('.form_box .group').is(':first-child')) {
            labelLeft += 10; // Add 33px to the left padding
          }
        }

        label.data('original-left', labelLeft);

        input.data('original-placeholder', input.attr('placeholder'));
        input.attr('placeholder', '');
        label.css({
          'position': 'absolute',
          'left': labelLeft + 'px',
          'transform': 'none',
          'pointer-events': 'none'
        });
        if (input.is('textarea, input[type="text"]:not([readonly])') && !input.is('input[type="radio"], select, input[type="text"][readonly]')) {
          label.css({
            'top': labelTop + 'px', // Center text inputs and textareas
            'transition': 'all 0.3s ease', // Add transition for text inputs and textareas
          });

          // Move radio and select labels to the top initially
        } else {
          label.css({
            'left': '25px',
            'top': '-5px',
            'font-size': '15px',
            'color': '#495057'
          });
        }
      }

    });
  }


  // Initial label setup
  checkAndUpdateLabelPosition();

  // Check and update labels on window resize
  $(window).on('resize', checkAndUpdateLabelPosition);



  $('.phone-trigger').click(function () {
    let input = $(this).closest('.group').find('.form_field');
    let label = input.closest('.group').find('.form_label label');

    // Check if the input is a text field or textarea
    if (input.is('input[type="text"], textarea')) {
      moveLabelUp(label);

    }
  });



  $('.Date1, .Date').click(function () {
    let input = $(this).closest('.group').find('.form_field');
    let label = input.closest('.group').find('.form_label label');

    // Check if the input is a text field or textarea
    if (input.is('input[type="text"], textarea')) {

      moveLabelUp(label);

    }
  });

  $('.Date1').each(function () {
    let input = $(this);
    if (input.val().trim() !== '') {
      input.datepicker('setDate', input.val()); // Set the date in the datepicker
      input.trigger('onSelect', [input.val(), input.datepicker('getDate')]); // Trigger onSelect
    }
  });


  // Initial label setup


  // Focus/blur handling for text inputs and textareas ONLY
  $('#submitform').on('focus blur', '.form_field', function () {

    let input = $(this);
    let label = input.closest('.group').find('.form_label label');

    if (input.is('input[type="text"], textarea')) {


      if (input.is(':focus') || input.val().trim() !== '') {
        input.attr('placeholder', input.data('original-placeholder'));

        moveLabelUp(label);

      } else {
        if ($(window).width() >= 500) {
          if (!input.hasClass('Date1') && !input.hasClass('Date') && !input.hasClass('timepicked')) { // If it's NOT a date input
            moveLabelCenter(label, input);
            input.attr('placeholder', '');
          }
          /*       moveLabelCenter(label, input);
                input.attr('placeholder', ''); */
          if (!label.closest('.form_box .group').is(':first-child')) {
            let originalLeft = label.data('original-left');
            label.css('left', originalLeft + 'px'); // Reset left position
          }
        }

      }
    }
  });


  $('body').append("<div class='load_holder'><div class='spinner'><div class='bounce1'></div><div class='bounce2'></div><div class='bounce3'></div></div>	<p>Submitting Form...</p></div>");


  $('.close').click(function () {
    $('#success').fadeOut();
    $('#recaptcha-error').fadeOut();
  });


  $('.rclose').click(function () {
    $('#recaptcha-error').fadeOut();
  });

  $('.error-close').click(function () {
    $('#error-msg').fadeOut();
  });


  $('input[type="radio"]').click(function () {
    $('input[type="radio"].error + label.error').remove();
  });


  var wskCheckbox = function () {
    var wskCheckboxes = [];
    var SPACE_KEY = 32;

    function animateCircle(checkboxElement) {
      var circle =
        checkboxElement.parentNode.getElementsByClassName('wskCircle')[0];
      var restore = '';
      if (circle.className.indexOf('flipColor') < 0) {
        restore = circle.className + ' flipColor';
      } else {
        restore = 'wskCircle';
      }
      circle.className = restore + ' show';
      setTimeout(function () {
        circle.className = restore;
      }, 150);
    }

    function addEventHandler(elem, eventType, handler) {
      if (elem.addEventListener) {
        elem.addEventListener(eventType, handler, false);
      }
      else if (elem.attachEvent) {
        elem.attachEvent('on' + eventType, handler);
      }
    }

    let isHandlerRunning = false;

    function clickHandler(e) {
      if (isHandlerRunning) return;
    
      e.stopPropagation();
      
      isHandlerRunning = true;
    
      var group = this.getAttribute('id').split('__')[0];
      var maxChecked = getLimit(group);
    
      // Count the number of checked checkboxes in the same group
      var checkedCount = wskCheckboxes.reduce(function(count, item) {
        return count + (item.checkbox.classList.contains('checked') && item.id.startsWith(group) ? 1 : 0);
      }, 0);
    
      if (!this.classList.contains('checked')) {
        if (checkedCount < maxChecked) {
          this.classList.add('checked');
        } else {
          alert('You can only select up to ' + maxChecked + ' checkboxes.');
        }
      } else {
        this.classList.remove('checked');
      }
      
      animateCircle(this);
    
      // Sync the actual checkbox state with the visual representation
      var cbox = document.getElementById(this.getAttribute('id'));
      if (cbox) {
        cbox.checked = this.classList.contains('checked');
      }
    
      setTimeout(() => {
        isHandlerRunning = false;
      }, 100);  // Small delay to prevent double execution
    }
      
    function keyHandler(e) {
      e.stopPropagation();
      if (e.keyCode === SPACE_KEY) {
        // Prevent the default space key behavior to avoid double toggle
        e.preventDefault(); 
        // Trigger the clickHandler on space key press
        clickHandler.call(this, e);
      }
    }
    
    document.querySelectorAll('.wskCheckbox').forEach(function(checkbox) {
      checkbox.addEventListener('click', clickHandler);
      checkbox.addEventListener('keydown', keyHandler);
    });
    


    function clickHandlerLabel(e) {
      e.preventDefault();  // Prevent default label behavior
  
      var id = this.getAttribute('for'); // Get the associated checkbox ID from the 'for' attribute
  
      // Find the group container
      var groupContainer = this.closest('.group');
  
      // Check if the group has a data-limit attribute and parse it; if not, set it to Infinity (no limit)
      var maxChecked = groupContainer.hasAttribute('data-limit') ? parseInt(groupContainer.getAttribute('data-limit'), 10) : Infinity;
  
      // Find the checkbox associated with the label
      var checkboxWrapper = wskCheckboxes.find(item => item.id === id);
      if (!checkboxWrapper) {
          console.error(`Checkbox with id ${id} not found.`);
          return;
      }
  
      var checkbox = checkboxWrapper.checkbox;
  
      // Determine if the checkbox is currently checked
      var isChecked = checkbox.classList.contains('checked');
  
      // Count the currently checked checkboxes in the same group
      var checkedCount = Array.from(groupContainer.querySelectorAll('.wskCheckbox.checked')).length;
  
      // Locate the actual checkbox input
      var actualCheckbox = document.getElementById(id);
      if (!actualCheckbox) {
          console.error(`Actual checkbox for ${id} not found.`);
          return;
      }
  
      // Logic to handle checking and unchecking
      if (!isChecked && checkedCount < maxChecked) {
          checkbox.classList.add('checked');
          actualCheckbox.checked = true; // Update the actual checkbox
          $(actualCheckbox).trigger('change'); // Trigger the change event
          animateCircle(checkbox);
      } else if (isChecked) {
          checkbox.classList.remove('checked');
          actualCheckbox.checked = false; // Update the actual checkbox
          $(actualCheckbox).trigger('change'); // Trigger the change event
          animateCircle(checkbox);
      } else if (!isChecked && checkedCount >= maxChecked) {
          alert('You can only select up to ' + maxChecked + ' checkboxes.');
      }
  }
  
  document.querySelectorAll('label.wskLabel').forEach(function(label) {
      label.addEventListener('click', clickHandlerLabel);
  });
  
  


    function checkboxValues(inputAttrName) {
      var inputAttrName = inputAttrName;
      var inputHidden = $('input[name="' + inputAttrName + '"]').attr('value');
      var checkedValues = '';
      var checkboxClass = $('input.' + inputAttrName + '');

      $.each(checkboxClass, function (index) {
        $(this).on('change', function () {
          var x = $(this).attr('value') + ', ';
          if ($(this).is(':checked')) {
            inputHidden += x;
            checkedValues = inputHidden.replace(/,\s*$/, "");
            $('input[name="' + inputAttrName + '"]').attr('value', checkedValues);
          } else {
            inputHidden = inputHidden.replace(x, '');
            checkedValues = inputHidden.replace(/,\s*$/, "");
            $('input[name="' + inputAttrName + '"]').attr('value', checkedValues);
          }
        });
      });
    }

    function findCheckBoxes() {
      var labels = document.getElementsByTagName('label');
      var i = labels.length;
      while (i--) {
        var posCheckbox = document.getElementById(labels[i].getAttribute('for'));
        if (posCheckbox !== null && posCheckbox.type === 'checkbox' &&
          (posCheckbox.className.indexOf('wskCheckbox') >= 0)) {
          var text = labels[i].innerText;
          var span = document.createElement('span');
          span.className = 'wskCheckbox';
          span.tabIndex = i;
          var span2 = document.createElement('span');
          span2.className = 'wskCircle flipColor';
          labels[i].insertBefore(span2, labels[i].firstChild);
          labels[i].insertBefore(span, labels[i].firstChild);
          addEventHandler(span, 'click', clickHandler);
          addEventHandler(span, 'keyup', keyHandler);
          addEventHandler(labels[i], 'click', clickHandlerLabel);
          var cbox = document.getElementById(labels[i].getAttribute('for'));
          if (cbox.getAttribute('checked') !== null) {
            span.click();
          }

          wskCheckboxes.push({
            'checkbox': span,
            'id': labels[i].getAttribute('for')
          });
        }
      }
    }

    return {
      init: findCheckBoxes
    };
  }();

  wskCheckbox.init();


  /* start add more */

  var cloneCount = 1;

  $('.addMore').click(function () {

    let html = $('.cloneField').html();
    $('.addreferral').append(`<div class='clone_data' id='mainCloneCount_0'>${html}<a href='javascript:;' style=' background: #f95858;  top: 7px;     padding: 3px 5px; color: #fff; border-radius: 3px; position: relative; bottom: 0;' class='removeCls' onclick='removeHTML()'><i class='fas fa-minus-circle'></i> Remove</a><hr></div>`);

    let i = $('.addreferral .clone_data').length; // Get the total number of cloned fields
    $('.addreferral .clone_data:last').each(function () { // Use :last to select the newly cloned field
      $(this).attr('id', 'mainCloneCount_' + i);
      $(this).find('.referral_name input').attr('name', 'Name' + ' (' + i + ')');
      $(this).find('.referral_name input').attr('placeholder', 'Enter name here');
      $(this).find('.referral_email input').attr('name', 'Email_Address_' + ' (' + i + ')').attr('id', 'Email_Address_' + i);
      $(this).find('.referral_email input').attr('placeholder', 'example@domain.com');
      $(this).find('.referral_phone input').attr('name', 'Contact_Number' + ' (' + i + ')').addClass('Contact_Number');
      $(this).find('.referral_phone input').attr('placeholder', 'Enter number here');
      $(this).find('.referral_count input').val(i);
      $(this).find('.removeCls').attr('onClick', 'removeHTML(' + i + ')');

      // Initialize labels for the newly cloned fields
      checkAndUpdateLabelPosition($(this).find('.form_field'));
    });

    $('#Email_Address_' + i).rules("add", {
      email: true,
      messages: { email: "" }
    });

    $(".Phone").keypress(function (e) {
      var verified = (e.which == 8 || e.which == undefined || e.which == 0) ? null : String.fromCharCode(e.which).match(/[^0-9 -]/);
      if (verified) { e.preventDefault(); }
    });
  });





  $('#error-message').hide();
  var MAX_FILE_SIZE = 10 * 1024 * 1024; // 10MB
  $("#file").change(function () {
    var ul_file = $(this).val();
    var extension = ul_file.substr((ul_file.lastIndexOf('.') + 1));
    var accepted_file_endings = ["pdf", "docx", "doc"];
    extension = extension.toLowerCase();
    fileSize = this.files[0].size;

    if ($(this).val() !== "") {
      if (fileSize > MAX_FILE_SIZE) {
        $('.suberror').text('File size exceeds maximum limit: 10 MB');
        $('#error-message').slideDown();
        $(".js-labelFile").addClass('uploaderror');
        $(".js-fileName").css({ "color": "#5c5c5c" });
        $("#file").val('');
      }
      else {
        if ($.inArray(extension, accepted_file_endings) !== -1) {
          $(".js-labelFile").removeClass('uploaderror');
          $('#error-message').hide();
        } else {
          $('.suberror').html('File type is not allowed. You can only upload <span style="left: 0; bottom: 0;  font-style:italic; color: unset; font-size: unset;">doc, docx, pdf</span> files.');
          $('#error-message').slideDown();
          $(".js-labelFile").addClass('uploaderror');
          $(".js-fileName").css({ "color": "#5c5c5c" });
          $("#file").val('');
        }
      }
    } else {
      $(".btn-tertiary").css({ "box-shadow": "0 7px 10px rgba(182,182,182,.05) !important" });
      $('#error-message').hide();
    }
  });


  (function () {

    'use strict';

    $('.input-file').each(function () {
      var $input = $(this),
        $label = $input.next('.js-labelFile'),
        labelVal = $label.html();

      $input.on('change', function (element) {
        var fileName = '';
        if (element.target.value) fileName = element.target.value.split('\\').pop();
        fileName ? $label.addClass('has-file').find('.js-fileName').html(fileName) : $label.removeClass('has-file').html(labelVal);
      });
    });

  })();

  function scaleCaptcha(elementWidth) {
    // Width of the reCAPTCHA element, in pixels
    var reCaptchaWidth = 304;
    // Get the containing element's width
    var containerWidth = $('.form_box5').width();

    // Only scale the reCAPTCHA if it won't fit
    // inside the container
    if (reCaptchaWidth > containerWidth) {
      // Calculate the scale
      var captchaScale = containerWidth / reCaptchaWidth;
      // Apply the transformation
      $('.g-recaptcha').css({
        'transform': 'scale(' + captchaScale + ')'
      });
    }
  }

  $(function () {

    // Initialize scaling
    scaleCaptcha();

    // Update scaling on window resize
    // Uses jQuery throttle plugin to limit strain on the browser
    $(window).resize($.throttle(100, scaleCaptcha));

  });
  $(".Alphanumeric, label:contains('Social Security Number'), input[name='Social_Security_Number']").keyup(function () {
    if (this.value.match(/[^a-zA-Z0-9 ]/g)) {
      this.value = this.value.replace(/[^a-zA-Z0-9 ]/g, '');
    }
  });

  $(".Alphanumeric, label:contains('Social Security Number'), input[name='Social_Security_Number']").focusout(function () {
    this.value = this.value.trim();
  });

  $("#Phone, input[name='Phone'], input[name='Phone_Number'], input[name='Cell_Number'], input[name='Telephone'], input[name='Telephone_Number'], input[name='Fax_Number'], .numberinput, input[name='Contact_Number']").keypress(function (e) {
    var verified = (e.which == 8 || e.which == undefined || e.which == 0) ? null : String.fromCharCode(e.which).match(/[^0-9 -]/);
    if (verified) { e.preventDefault(); }
  });

  $("label:contains('Phone Number'), label:contains('Cell Number'), label:contains('Cellphone Number'), label:contains('Telephone'), label:contains('Telephone Number'), label:contains('Fax Number'), label:contains('Fax'), label:contains('Cel'), label:contains('Contact Number')").each(function () {
    $(this).parent().next('div').find(':input').keypress(function (e) {
      var verified = (e.which == 8 || e.which == undefined || e.which == 0) ? null : String.fromCharCode(e.which).match(/[^0-9 -]/);
      if (verified) { e.preventDefault(); }
    });
  });


  $('#Phone, input[name="Phone_Number"]').keypress(function () {
    if ($(this).val().length >= 12) {
      $(this).val($(this).val().slice(0, 12));
    }
  });

  $('select').each(function () {
    if ($(this).val() == "")
      $(this).css({
        'color': '#b1b1b1',
        'font-style': 'normal'
      });
    else
      $(this).css({
        'color': '#5c5c5c',
        'font-style': 'normal'
      });
  });

  $('select').change(function () {
    if ($(this).val() == "")
      $(this).css({
        'color': '#b1b1b1',
        'font-style': 'normal'
      });
    else
      $(this).css({
        'color': '#5c5c5c',
        'font-style': 'normal'
      });
  });

});

$('input:radio').click(function () {
  $("input:radio").each(function () {
    $(this).closest("td").toggleClass("highlight", $(this).is(":checked"));
  });
});

$("label:contains('Date of Birth'), label:contains('Birthdate'), label:contains('How soon can you start'), label:contains('Preferred Date'), label:contains('on what date can you start work')").each(function () {
  $(this).parent().next('div').find(':input').removeClass('Date').addClass('Date1');
});
$("label:contains('Date of Birth'), label:contains('Birthdate')").each(function () {
  $(this).parent().next('div').find(':input').addClass('DisableFuture');
});
$("label:contains('How soon can you start'), label:contains('Preferred Date'),  label:contains('on what date can you start work')").each(function () {
  $(this).parent().next('div').find(':input').addClass('DisablePast');
});



// NORMAL DATE FIELDS
$('.Date').datepicker({
  autoHide: true,
  pick: function (e) {
    e.preventDefault(); //prvent any default action..
    var pickedDate = e.date; //get date
    var date = e.date.getDate()
    var month = $(this).datepicker('getMonthName')
    var year = e.date.getFullYear()
    var new_date = month + " " + date + ", " + year
    //set date
    // $(this).val(`${date} ${month} ${year}`)
    $(this).val(new_date)

  }
});

// DISABLE FUTURE DATES
var today = Date.now();
$('.DisableFuture').datepicker({
  autoHide: true,
  zIndex: 2048,
  endDate: today,
  pick: function (e) {
    e.preventDefault(); //prvent any default action..
    var pickedDate = e.date; //get date
    var date = e.date.getDate()
    var month = $(this).datepicker('getMonthName')
    var year = e.date.getFullYear()
    var new_date = month + " " + date + ", " + year
    $(this).val(new_date)
  }
});

// DISABLE PAST DATES
$('.DisablePast').datepicker({
  autoHide: true,
  zIndex: 2048,
  startDate: today,
  pick: function (e) {
    e.preventDefault(); //prvent any default action..
    var pickedDate = e.date; //get date
    var date = e.date.getDate()
    var month = $(this).datepicker('getMonthName')
    var year = e.date.getFullYear()
    var new_date = month + " " + date + ", " + year

    $(this).val(new_date)
  }
});


$("input[data-type='currency']").on({
  keyup: function () {
    formatCurrency($(this));
  },
  blur: function () {
    formatCurrency($(this), "blur");
  }
});


function formatNumber(n) {
  return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}


function formatCurrency(input, blur) {
  var input_val = input.val();
  if (input_val === "") { return; }
  var original_len = input_val.length;
  var caret_pos = input.prop("selectionStart");
  if (input_val.indexOf(".") >= 0) {
    var decimal_pos = input_val.indexOf(".");
    var left_side = input_val.substring(0, decimal_pos);
    var right_side = input_val.substring(decimal_pos);
    left_side = formatNumber(left_side);
    right_side = formatNumber(right_side);

    if (blur === "blur") {
      right_side += "00";
    }
    right_side = right_side.substring(0, 2);
    input_val = left_side + "." + right_side;

  } else {
    input_val = formatNumber(input_val);
    input_val = input_val;

    // final formatting
    if (blur === "blur") {
      input_val += ".00";
    }
  }

  // send updated string to input
  input.val(input_val);

  // put caret back in the right position
  var updated_len = input_val.length;
  caret_pos = updated_len - original_len + caret_pos;
  input[0].setSelectionRange(caret_pos, caret_pos);
}





$(function () {
  $('input[name="First_Name"], input[name="Last_Name"], input[name="Name"], input[name="Full_Name"]').keydown(function (e) {
    var key = e.keyCode;
    if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {
      e.preventDefault();
    }
  });
});



/*Auto-height refresh*/

function adjustIframeHeight() {
  const iframe = parent.document.getElementById('myframe');
  if (iframe) {
    let lastHeight = 0;
    const interval = setInterval(() => {
      const newHeight = iframe.contentWindow.document.body.scrollHeight;
      if (newHeight !== lastHeight) {
        iframe.style.height = (newHeight + 100) + 'px';
        lastHeight = newHeight;
      }
    }, 300); // Adjust interval (in ms) as needed
  }
}

// Initial call on page load (assuming the iframe content loads quickly)
adjustIframeHeight();

// Add an event listener inside the iframe for content changes
// (This is needed if the content changes dynamically, e.g., AJAX calls)
window.addEventListener('resize', adjustIframeHeight);