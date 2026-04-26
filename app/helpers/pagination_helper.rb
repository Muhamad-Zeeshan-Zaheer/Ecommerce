module PaginationHelper
  # Custom pagination helper with styled arrows instead of Next/Previous
  def paginate_with_arrows(collection)
    will_paginate collection, class: 'apple_pagination',
      previous_label: '<i class="bi bi-chevron-left"></i>',
      next_label: '<i class="bi bi-chevron-right"></i>',
      inner_window: 2,
      outer_window: 1
  end
end
