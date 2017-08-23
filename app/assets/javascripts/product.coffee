jQuery ->
  $('#subcategory_id').parent().hide()
  subcategories = $("#subcategory_id").html()
  $("#product_category_id").change ->
    category = $('#product_category_id :selected').text();
    options = $(subcategories).filter("optgroup[label='#{category}']").html()

    if (options)
      $('#product_subcategory_id').html(options)
      $('#product_subcategory_id').parent().show()
    else
      $('#product_subcategory_id').empty()
      $('#product_subcategory_id').parent().hide()
