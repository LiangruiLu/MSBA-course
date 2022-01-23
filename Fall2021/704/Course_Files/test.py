import pandas as pd
import numpy as ny

help(pd)
df = pd.read_excel('HW4_inc5000-2018.xlsx', index_col='RANK')  # load file and set index to RANK
print(df)
print("The total number of companies on the list is %d" % df['COMPANY NAME'].value_counts(dropna=True).sum())
print(df.head(25))
df = df.drop(columns=['Unnamed: 14', 'Unnamed: 15'])  # drop two last columns
df.rename(columns={"CITY.1": "STATE NAME", "REVENUW": "REVENUE"}, inplace=True)
print(df.count())  # show the missing values details
# fill missing values in column 'CITY' using column 'CITY, STATE'
i = df[df['CITY'].isnull()].index
print(i)
df.loc[i, 'CITY'] = df.loc[i, 'CITY, STATE'].str.split(',').str[0]

# fill missing values in column 'STATE' using column 'CITY, STATE'
i_1 = df[df['STATE'].isnull()].index
print(i_1)
df.loc[i_1, 'STATE'] = df.loc[i_1, 'CITY, STATE'].str.split(', ').str[1]
# fill missing values in column 'CITY, STATE' using column 'CITY' and column 'STATE'
i_2 = df[df['CITY, STATE'].isnull()].index
print(i_2)
df.loc[i_2, 'CITY, STATE'] = df.loc[i_2, 'CITY'] + ', ' + df.loc[i_2, 'STATE']
# print(df[['STATE', 'STATE NAME']].set_index('STATE').to_dict()['STATE NAME'])
df['STATE NAME'] = df['STATE NAME'].fillna(df['STATE']
                                           .map(df[['STATE', 'STATE NAME']].set_index('STATE').to_dict()['STATE NAME']))
df['FOUNDED'] = df['FOUNDED'].fillna('0')
print(df.count())  # show the missing values details after filling

df = pd.DataFrame({"value": np.random.randint(0, 100, 20)})

labels = ["{0} - {1}".format(i, i + 9) for i in range(0, 100, 10)]

df["group"] = pd.cut(df.value, range(0, 105, 10), right=False, labels=labels)

df.head(10)


