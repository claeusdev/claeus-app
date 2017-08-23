jQuery ->
  $('#product_category_id').parent().hide()
  children = $("#product_category_id").html()
  $("#product_category_id").change ->
    category = $('#product_category_id :selected').text();
    options = $(categories).filter("optgroup[label='#{category}']").html()

    if (options)
      $('#product_children_id').html(options)
      $('#product_children_id').parent().show()
    else
      $('#product_children_id').empty()
      $('#product_children_id').parent().hide()