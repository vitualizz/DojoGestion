function getModal(data) {
  $('body').append("<div class='modal'> <div class='modal-background' /> <div class='modal-card' /></div>").find('.modal .modal-card').html(data)
  $('.modal header').addClass('modal-card-head')
  $('.modal header p').addClass('modal-card-title')
  $('.modal header').append('<button aria-label="close" class="close-modal delete"></button>')
  $('.modal section').addClass('modal-card-body')
  $('.modal footer').addClass('modal-card-foot')
  $('.modal footer').append('<button class="close-modal">Cancelar</button>')
  $('.modal footer input').addClass('button')
  $('.modal footer button').addClass('button')
}

export function Modal() {
  $('a[data-modal]').on('click', function() {
    $.get(
      $(this).attr('href'),
      data => { getModal(data) }
    ).done( function() {
      $('.modal').addClass('is-active')
    })
    return false;
  });

  $(document).on('click', '.close-modal', function(){
    $('.modal').remove()
  })
}    
