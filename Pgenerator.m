function [P] = Pgenerator(k,n)
%P_GENERATOR    Permutation generator
%   P_GENERATOR(k,n) generates a random n-by-n permutation matrix P, using
%   k as the random number generator seed.
%
%   Primary Reference: "Key Generation of Algebraic-Code Cryptosystems"
%   Hung-Min Sun and Tzonelih Hwang
%

% STEP 1
rng(k) %define seed of random number generator
r = randperm(n-2);
r = [r,0];

% STEP 2
P = zeros(n);
P(1,1) = 1;
lockedrows_p = zeros(1,n);
lockedcols_p = zeros(1,n);
lockedrows_p(1) = 1;
row = 1;
col = 1;

% STEP 3
for i = 1:(n-1)
    row = find(lockedrows_p==0,1);
    lockedcols_p(col) = 1;
    col = max(find(lockedcols_p==0,r(i)+1));
    P(row,col) = ~P(row,col);
    lockedrows_p(row) = 1;
end
end