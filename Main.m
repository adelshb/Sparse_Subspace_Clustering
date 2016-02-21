% This is the main function for running the test for Sparse Subspace 
% Clustering. The code and the data used are avaliable at 
% http://www.vision.jhu.edu/ssc.htm. 
% The project here is to run one example from the Hopkins-155 dataset and
% to compare the Sparse Subspace Clustering with the Spectral Clustering 
% and kmeans.

clc, clear all, close all

% Load the data 
load('1R2RC_truth.mat');
k = 3; %Number of clusters

% Prepare the data matrix X, the rows are the points, the columns are the
% positions in different times
X = zeros(points,2*frames);
for p = 1 : points
    for f = 1 :frames
        X(p,f) = x(1,p,f);
        X(p,f+frames) = x(2,p,f);
    end
end

'Plotting raw data...'
% Plot the first frame of the data without the clustering
plotSSC(ones(points,1),X);

'Plotting data after kmeans...'
% Plot the first frame of the data with kmeans
opts = statset('Display','final');
[idx,~] = kmeans(X,k,'Distance','cityblock','Replicates',5,'Options',opts);
plotSSC(idx,X);

'Plotting data after Spectral Clustering...'
% Compute distance matrix for the adjency matric
A = squareform(pdist(X));
sigma = 1;
% Calculates Gaussian similarity matrix
A = exp(-A.^2 ./ (2*sigma^2));
[idx,~] = SpectralClustering(A,k);
plotSSC(idx,X);

'Plotting data after Sparse Subspace Clustering...'
% The coefficient are optimized for the this case
r = 4*2; %Enter the projection dimension e.g. r = d*n, enter r = 0 to not project
Cst = 1; %Enter 1 to use the additional affine constraint sum(c) == 1
OptM = 'Lasso'; %OptM can be {'L1Perfect','L1Noise','Lasso','L1ED'}
lambda = 0.001; %Regularization parameter in 'Lasso' or the noise level for 'L1Noise'
K = 4; %Number of top coefficients to build the similarity graph, enter K=0 for using the whole coefficients

Xp = DataProjection(transpose(X),r,'NormalProj');
CMat = SparseCoefRecovery(X,Cst,OptM,lambda);
A = BuildAdjacency(CMat,K);
[idx,~] = SpectralClustering(A,k);
plotSSC(idx,X);
