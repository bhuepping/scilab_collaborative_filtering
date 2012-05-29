function ratingmatrix = putratings(ratings)
  ratingmatrix = zeros(max(ratings(:,1)),max(ratings(:,2)));
  for i=1:size(ratings,1)
    ratingmatrix(ratings(i,1),ratings(i,2)) = ratings(i,3);
  end
endfunction
