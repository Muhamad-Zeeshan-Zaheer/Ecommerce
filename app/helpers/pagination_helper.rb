module PaginationHelper
  # Custom pagination helper with arrows instead of Next/Previous
  def paginate_with_arrows(collection)
    will_paginate collection, class: 'apple_pagination',
      previous_label: '←',
      next_label: '→',
      inner_window: 2,
      outer_window: 1
  end
end
