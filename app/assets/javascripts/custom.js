$(document).on("turbolinks:load", function() {
  $('.js-example-basic-single').select2({
    placeholder: "Select a channel",
    allowClear: true,
    tags: true
  });

  $('#search').autocomplete({
      source: '/auto_fill_text/autocomplete',
      select: function(event, ui){
        $('#search').val(ui.item.value);
        $(this).closest('form').trigger('submit');
      }
  });

  $('#search_user').autocomplete({
    source: '/auto_fill_text/getusers',
    select: function(event, ui){
      $('#search_user').val(ui.item.value);
      $(this).closest('form').trigger('submit');
    }
  });
});
