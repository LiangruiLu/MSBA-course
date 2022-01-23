import pandas as pd
import numpy as np

boston = pd.read_csv("BostonHousingData.csv")
# boston["id"] = list(range(1, boston.value_counts().sum()+1))
# boston.set_index("id", inplace=True, drop=True)
# boston.index = list(range(1, boston.value_counts().sum() + 1))
print(boston.head(3))
print(boston.tail(3))
print(boston['CRIM'].describe())
print(np.sort(boston["ZN"].unique()))
print(np.where(boston.isnull() == True))
boston_medv_desc = boston.sort_values('MEDV', ascending=False)
print(boston_medv_desc)
