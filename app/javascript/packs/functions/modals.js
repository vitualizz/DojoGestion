export function modals() {
  $('a[data-modal]').on('click', function() {
    $.get(
      $(this).attr('href'),
      data => { $('body').append("<div class='modal' />").find('.modal').html(data).addClass("is-active"); });

    return false;
  });

  $(document).on('click', '.close-modal', function(){
    $('.modal').remove()
  })
}    
