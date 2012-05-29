function [users_new, items_new, smewr_new, it_error] = iterate(ratings,users,items,lambda,current_smewr,TOL)

//constants for armijo step size:
armijobeta = 0.8;
armijosigma = 0.1;

it_error = 0;

[usergrad,itemgrad] = gradients(ratings,users,items,lambda);
square_norm_gradient = sum(usergrad.^2) + sum(itemgrad.^2);

alpha = 1;

users_new = users - alpha*usergrad;
items_new = items - alpha*itemgrad;

smewr_new = smewr(ratings,users_new,items_new,lambda);

while (smewr_new > current_smewr - armijosigma*alpha*square_norm_gradient)
  alpha = alpha * armijobeta;
  users_new = users - alpha*usergrad;
  items_new = items - alpha*itemgrad;
  smewr_new = smewr(ratings,users_new,items_new,lambda);
end
if (alpha < TOL)
  printf('STOP: Alpha too small!\n\n');
  it_error = -1;
end
if (square_norm_gradient < TOL)
  printf('STOP: Solution found!\n\n');
  it_error = square_norm_gradient;
end

endfunction

