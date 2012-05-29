function value = sme(ratings,users,items)
  nr = size(ratings,1);

  value = 0;
  
  for i = 1:nr
    value = value + (ratings(i,3) - users(:,ratings(i,1))'*items(:,ratings(i,2)))^2;
  end

endfunction

