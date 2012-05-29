function value = smewr(ratings,users,items,lambda)

  value = sme(ratings,users,items) + lambda*(sum(users.^2) + sum(items.^2));

endfunction

