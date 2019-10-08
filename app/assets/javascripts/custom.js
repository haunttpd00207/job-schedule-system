$( document ).on('turbolinks:load', function() {
  $('#search').autocomplete({
    source: '/autocomplete',
    select: function(event, ui){
      $('#search').val(ui.item.value);
      $(this).closest('form').trigger('submit');
    }
  });
});

$( document ).on('turbolinks:load', function() {
  $('#search_user').autocomplete({
    source: '/getusers',
    select: function(event, ui){
      $('#search_user').val(ui.item.value);
      $(this).closest('form').trigger('submit');
    }
  });
});
