% Don't forget: If you run matlab without -singleCompThread, you need to
% set the number of threads here!  If you using thirdparty libraries
% like Cplex or Gurobi, you need to set their thread limits as well.

% Here we set the numThreads variable in the qsub submission script
numThreads
maxNumCompThreads(numThreads)

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

