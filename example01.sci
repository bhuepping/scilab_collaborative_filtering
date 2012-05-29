function example01(ratingsfile, nf, lambda, maxiter, tolerance)
// arguments: 
// *) the file containing the given ratings,
// *) the dimension of the feature space,
// *) the regularization parameter lambda
// *) the maximal number of iterations
// *) the tolerance for the optimizer

exec kernel/sme.sci;
exec kernel/smewr.sci;
exec kernel/gradients.sci;
exec kernel/putratings.sci;
exec kernel/iterate.sci;
exec kernel/makehtml.sci;

// read ratings:
ratings = fscanfMat(ratingsfile);

nu = max(ratings(:,1));
ni = max(ratings(:,2));

// initialize the random number generator:
rand('seed',getdate('s'))
user_features = 0.1*rand(nf,nu);
item_features = 0.1*rand(nf,ni);

current_smewr = smewr(ratings,user_features,item_features,lambda);

for i=1:maxiter
  [user_features, item_features, current_smewr, it_error] = iterate(ratings,user_features,item_features,lambda,current_smewr,tolerance);
  if (it_error ~= 0)
    break
  end
end

printf('Number of iterations: %i\n',i);
printf('Estimated rating matrix:');
disp(user_features'*item_features);

printf('Given rating matrix:');
disp(putratings(ratings))

printf('Objective function value: %1.6e, rsme: %1.6e\n',current_smewr, sqrt(sme(ratings, user_features, item_features)/size(ratings,1)));

fprintfMat('user_features.csv',user_features,'  %+1.6e')
fprintfMat('item_features.csv',item_features,'  %+1.6e')

makehtml('user_features.html',user_features);
makehtml('item_features.html',item_features);

endfunction

