import numpy as np
import pandas as pd
import os

HOUSING_PATH = os.path.join("..", "datasets", "housing")

def load_housing_data(housing_path=HOUSING_PATH):
    csv_path = os.path.join(housing_path, "housing.csv")
    return pd.read_csv(csv_path)

def split_train_test(data, test_ratio):
    shuffled_indices = np.random.permutation(len(data))
    test_set_size = int(len(data) * test_ratio)
    test_indices = shuffled_indices[:test_set_size]
    train_indices = shuffled_indices[test_set_size:]
    return data.iloc[train_indices], data.iloc[test_indices]

housing = load_housing_data()

train_set, test_set = split_train_test(housing, 0.2)

print(np.random.permutation(1000), len(housing), len(housing) * 0.2)
print(len(train_set), "train +", len(test_set), "test")
