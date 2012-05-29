function [user_gradient,item_gradient] = gradients(ratings,users,items,lambda)
  nf = size(users,1);
  nu = size(users,2);
  ni = size(items,2);
  nr = size(ratings,1);

  
//  regularization part of the gradients:
  user_gradient = 2*lambda*users;
  item_gradient = 2*lambda*items;
//  for each user:
//  (this can certainly be optimized for speed, its now optimized for programming convenience)


  for u = 1:nu
    user_u_ratings = ratings(ratings(:,1)==u,:);
    user_u_update = zeros(nf,1);
    for i = 1:size(user_u_ratings,1)
// add the sum -2*r_ui*q_i:
      item_ui = items(:,user_u_ratings(i,2));
      user_u_update = user_u_update - 2 * user_u_ratings(i,3)*item_ui;
// add the sum +q_i*q_i^T*p_u:
      user_u_update = user_u_update + 2 * item_ui*(item_ui'*users(:,u));
    end
    user_gradient(:,u) = user_gradient(:,u) + user_u_update;
  end

  for i = 1:ni
    item_i_ratings = ratings(ratings(:,2)==i,:);
    item_i_update = zeros(nf,1);
    for u = 1:size(item_i_ratings,1)
// add the sum -2*r_ui*p_i:
      user_ui = users(:,item_i_ratings(u,1));
      item_i_update = item_i_update - 2 * item_i_ratings(u,3)*user_ui;
// add the sum p_u*p_u^T*q_i:
      item_i_update = item_i_update + 2 * user_ui*(user_ui'*items(:,i));
    end
    item_gradient(:,i) = item_gradient(:,i) + item_i_update;
  end


endfunction

