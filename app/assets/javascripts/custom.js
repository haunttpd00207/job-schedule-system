$(document).on("turbolinks:load", function() {
  $('.js-example-basic-single').select2({
    placeholder: "Select a channel",
    allowClear: true,
    tags: true
  });
});
