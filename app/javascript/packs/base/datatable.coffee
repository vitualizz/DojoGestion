DataTable = $.fn.dataTable
r = $.fn.dataTableExt

module.exports = ($) ->
  $.extend DataTable.defaults,
    dom: "<'columns column-space-between'<'column is-narrow'f><'column is-narrow'p>><'columns'<'column'tr>><'columns column-space-between'<'column is-narrow'l><'column is-narrow'i>>"
    bAutoWidth: false
    processing: true
    serverSide: true
    pagingType: 'full_numbers'

  $.extend r.oStdClasses,
    sWrapper: "dataTables_wrapper",
    sTable: "table is_width_100",
    sFilterInput: "input",
    sProcessing: "dataTables_processing panel panel-default",
    sPageButton: "pagination-link",
    sPageButtonActive: "is-current",
    sPagePrevious: "pagination-previous",
    sPageNext: "pagination-next"




  # Pagination Buttons
  r.renderer.pageButton._ = (settings, host, idx, buttons, page, pages) ->
    api = new DataTable.Api(settings)
    classes = settings.oClasses
    lang = settings.oLanguage.oPaginate
    aria = settings.oLanguage.oAria.paginate or {}
    btnDisplay = undefined
    btnClass = undefined
    btnAttribute = undefined
    counter = 0

    attach = (container, buttons) ->
      i = undefined
      ien = undefined
      node = undefined
      button = undefined

      clickHandler = (e) ->
        e.preventDefault()
        if !$(e.currentTarget).hasClass('is-disabled') and `api.page() != e.data.action`
          api.page(e.data.action).draw 'page'
        return

      i = 0
      ien = buttons.length
      while i < ien
        button = buttons[i]
        if $.isArray(button)
          attach container, button
        else
          btnDisplay = ''
          btnClass = ''
          btnAttribute = ''
          switch button
            when 'ellipsis'
              btnDisplay = '&#x2026;'
              btnClass = 'pagination-link is-disabled'
              btnAttribute = 'disabled'
            when 'first'
              btnDisplay = lang.sFirst
              btnClass = 'previous ' + button + (if page > 0 then '' else ' is-disabled')
              btnAttribute = if page > 0 then '' else 'disabled'
            when 'previous'
              btnDisplay = lang.sPrevious
              btnClass = button + (if page > 0 then '' else ' is-disabled')
              btnAttribute = if page > 0 then '' else 'disabled'
            when 'next'
              btnDisplay = lang.sNext
              btnClass = button + (if page < pages - 1 then '' else ' is-disabled')
              btnAttribute = if page < pages - 1 then '' else 'disabled'
            when 'last'
              btnDisplay = lang.sLast
              btnClass = 'next ' + button + (if page < pages - 1 then '' else ' is-disabled')
              btnAttribute = if page < pages - 1 then '' else 'disabled'
            else
              btnDisplay = button + 1
              btnClass = if `page == button` then 'is-current' else ''
              btnAttribute = ''
              break
          if btnDisplay
            if `button == 'previous'` or `button == 'next'` or `button == 'last'`
              node = $('<a>',
                'class': 'pagination-' + btnClass
                'id': if `idx == 0` and `typeof button == 'string'` then settings.sTableId + '_' + button else null
                'href': '#'
                'aria-controls': settings.sTableId
                'aria-label': aria[button]
                'data-dt-idx': counter
                'tabindex': settings.iTabIndex).html(btnDisplay).prependTo(container)
              if `btnAttribute == 'disabled'`
                node.attr 'disabled', 'disabled'
            else
              numberButton = $('<a>',
                'class': classes.sPageButton + ' ' + btnClass
                'href': '#'
                'aria-controls': settings.sTableId
                'aria-label': aria[button]
                'data-dt-idx': counter
                'tabindex': settings.iTabIndex).html(btnDisplay)
              listItem = $('<li>', 'id': if `idx == 0` and `typeof button == 'string'` then settings.sTableId + '_' + button else null)
              if `btnAttribute == 'disabled'`
                listItem.addClass 'is-disabled'
                numberButton.attr 'disabled', 'disabled'
              node = listItem.append(numberButton).appendTo(container)
            settings.oApi._fnBindAction node, { action: button }, clickHandler
            counter++
        i++
      return

    # IE9 throws an 'unknown error' if document.activeElement is used
    # inside an iframe or frame.
    activeEl = undefined
    try
      # Because this approach is destroying and recreating the paging
      # elements, focus is lost on the select button which is bad for
      # accessibility. So we want to restore focus once the draw has
      # completed
      activeEl = $(host).find(document.activeElement).data('dt-idx')
    catch e
    navButtons = []
    midElementIndex = if buttons.length > 3 then 2 else 1
    i = 0
    while i < buttons.length
      `i != midElementIndex` and navButtons.push(buttons[i])
      i++
    next = navButtons.indexOf('next')
    if `next != -1`
      navButtons.splice next, 1
      navButtons.push 'next'
    previous = navButtons.indexOf('previous')
    if `previous != -1`
      navButtons.splice previous, 1
      navButtons.unshift 'previous'
    attach $(host).empty().html('<ul class="pagination-list"/>').children('ul'), buttons[midElementIndex]
    $(host).find('.pagination-list').wrap '<nav class="pagination is-centered"></nav>'
    attach $(host).find('nav'), navButtons
    if `activeEl != undefined`
      $(host).find('[data-dt-idx=' + activeEl + ']').focus()
    $('#' + settings.sInstance + '_wrapper label > select').wrap '<span class="select"></span>'
    searchInput = $('#' + settings.sInstance + '_filter>label').find('input').detach()
    if searchInput.length > 0
      searchInput.addClass 'is-fullwidth'
      label = $('#' + settings.sInstance + '_filter>label').wrap('<div class="control-label"></div>')
      label.parent().parent().append(searchInput).addClass 'control is-horizontal'
    $('#' + settings.sInstance + '_processing').html '<div class="modal is-active"><div class="modal-content modal-loading"><div class="box box-loading">Bezig...</div></div></div>'
    return
