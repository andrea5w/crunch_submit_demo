% Don't forget: If you want to run Matlab with one single threads, you need
% to specify -singleCompThread when you call it.
% If you matlab code calls other libraries like cplex of gurobi, you also
% need to adjust their thread use to 1.

% Specify size of the linear system
n = 2000;

% Number of solves for computing the average time:
num_runs = 20

% Start measuring time
tic

% Repeatedly solve the linear system
for i = 1:num_runs
    A = randn(n,n);
    b = randn(n);

    sol = A\b;

    fprintf('Run %3d: Norm of solution = %e.\n', i, norm(sol));
    toc
end
elapsed_time = toc

fprintf('\nAverage time per linear system solve: %f.\n', elapsed_time/num_runs)
