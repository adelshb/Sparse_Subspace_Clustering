# Sparse_Subspace_Clustering

==================================
Test of Sparse Subspace Clustering
==================================
Version: February 21st, 2016

The aim of the program is to test the efficiency of the Sparse Subspace Clustering technic available at http://www.vision.jhu.edu/ssc.htm. 

The code has been adapted to one example of the Hopkins-155 dataset, namely ‘1R2RC_truth.mat’. 

The main program follows the following steps:
1. Load the data and build the data matrix
2. Plot the first frame.
3. Plot the first frame with the result of a kmeans.
3. Compute the Agency matrix and plot the first frame with the result of a Spectral Clustering.
3. Compute the Agency matrix from the Sparse Subspace technic and plot the first frame with the result of a Spectral Clustering.
