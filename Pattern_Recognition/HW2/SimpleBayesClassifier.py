import random as rnd
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from scipy import stats

class SimpleBayesClassifier:

    def __init__(self, n_pos, n_neg):
        
        """
        Initializes the SimpleBayesClassifier with prior probabilities.

        Parameters:
        n_pos (int): The number of positive samples.
        n_neg (int): The number of negative samples.
        
        Returns:
        None: This method does not return anything as it is a constructor.
        """

        self.n_pos = n_pos
        self.n_neg = n_neg
        self.prior_pos = n_pos / (n_pos + n_neg)
        self.prior_neg = n_neg / (n_pos + n_neg)

    def fit_params(self, x, y, n_bins = 10):
        """
        Computes histogram-based parameters for each feature in the dataset.

        Parameters:
        x (np.ndarray): The feature matrix, where rows are samples and columns are features.
        y (np.ndarray): The target array, where each element corresponds to the label of a sample.
        n_bins (int): Number of bins to use for histogram calculation.

        Returns:
        (stay_params, leave_params): A tuple containing two lists of tuples, 
        one for 'stay' parameters and one for 'leave' parameters.
        Each tuple in the list contains the bins and edges of the histogram for a feature.
        """

        self.stay_params = [(None, None) for _ in range(x.shape[1])]
        self.leave_params = [(None, None) for _ in range(x.shape[1])]

        # INSERT CODE HERE
        for j in range(x.shape[1]):
            a = x[y == 0, j]
            b = x[y == 1, j]
            a = a[~np.isnan(a)]
            b = b[~np.isnan(b)]
            hist_a, edges_a = np.histogram(a, bins=n_bins)
            hist_a = hist_a / np.sum(hist_a)
            hist_a[hist_a == 0] = 1e-5
            hist_b, edges_b = np.histogram(b, bins=n_bins)
            hist_b = hist_b / np.sum(hist_b)
            hist_b[hist_b == 0] = 1e-5
            self.stay_params[j] = (hist_a, edges_a)
            self.leave_params[j] = (hist_b, edges_b)
        return self.stay_params, self.leave_params

    def predict(self, x, thresh = 0):

        """
        Predicts the class labels for the given samples using the non-parametric model.

        Parameters:
        x (np.ndarray): The feature matrix for which predictions are to be made.
        thresh (float): The threshold for log probability to decide between classes.

        Returns:
        result (list): A list of predicted class labels (0 or 1) for each sample in the feature matrix.
        """
        y_pred = []

        # INSERT CODE HERE
        log_p_stay = np.log(self.prior_neg)
        log_p_leave = np.log(self.prior_pos)

        for i in range(x.shape[0]):
            for j in range(x.shape[1]):
                if not np.isnan(x[i, j]):
                    log_p_stay += np.log(self.stay_params[j][0][int(x[i][j]) - 1])
                    log_p_leave += np.log(self.leave_params[j][0][int(x[i][j]) - 1])
            y_pred.append(1 if log_p_leave > log_p_stay else 0)

        return np.array(y_pred)
    
    def fit_gaussian_params(self, x, y):

        """
        Computes mean and standard deviation for each feature in the dataset.

        Parameters:
        x (np.ndarray): The feature matrix, where rows are samples and columns are features.
        y (np.ndarray): The target array, where each element corresponds to the label of a sample.

        Returns:
        (gaussian_stay_params, gaussian_leave_params): A tuple containing two lists of tuples,
        one for 'stay' parameters and one for 'leave' parameters.
        Each tuple in the list contains the mean and standard deviation for a feature.
        """

        self.gaussian_stay_params = [(0, 0) for _ in range(x.shape[1])]
        self.gaussian_leave_params = [(0, 0) for _ in range(x.shape[1])]

        # INSERT CODE HERE
        for j in range(x.shape[1]):
            a = x[y == 0, j]
            b = x[y == 1, j]
            a = a[~np.isnan(a)]
            b = b[~np.isnan(b)]
            self.gaussian_stay_params[j] = (np.mean(a), np.var(a, ddof=1))
            self.gaussian_leave_params[j] = (np.mean(b), np.var(b, ddof=1))
        
        return self.gaussian_stay_params, self.gaussian_leave_params
    
    def gaussian_predict(self, x, thresh = 0):

        """
        Predicts the class labels for the given samples using the parametric model.

        Parameters:
        x (np.ndarray): The feature matrix for which predictions are to be made.
        thresh (float): The threshold for log probability to decide between classes.

        Returns:
        result (list): A list of predicted class labels (0 or 1) for each sample in the feature matrix.
        """

        y_pred = []

        # INSERT CODE HERE
        log_p_stay = np.log(self.prior_neg)
        log_p_leave = np.log(self.prior_pos)

        for i in range(x.shape[0]):
            for j in range(x.shape[1]):
                if not np.isnan(x[i, j]):
                    log_p_stay += np.log(stats.norm.pdf(x[i, j], self.gaussian_stay_params[j][0], np.sqrt(self.gaussian_stay_params[j][1])))
                    log_p_leave += np.log(stats.norm.pdf(x[i, j], self.gaussian_leave_params[j][0], np.sqrt(self.gaussian_leave_params[j][1])))
            y_pred.append(1 if log_p_leave > log_p_stay else 0)

        return np.array(y_pred)