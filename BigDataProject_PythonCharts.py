
# coding: utf-8

# In[40]:

#importing pandas
import pandas as pd


# In[41]:

#importing numpy
import numpy as np


# In[42]:

#importing matplotlib
import matplotlib.pylab as plt
from matplotlib.pylab import rcParams


# In[75]:

#ading the data from csv
newdat =  pd.read_csv("C:/Users/trish/Desktop/BD/Clean.csv")
#parsing the dates
parseddata = pd.read_csv("C:/Users/trish/Desktop/BD/Clean.csv", parse_dates=True, index_col='Date')


# In[47]:

#dropping the extra unnamed first column from the CSV
procdata = parseddata.drop('Unnamed: 0',1)


# In[48]:

#indexing the dates
procdata.index


# In[49]:

#importing datetime
from datetime import datetime


# In[50]:

#plotting grapgh to see daily pattern of crimes
plt.figure(figsize=(12,6))
procdata.resample('D').size().rolling(365).sum().plot()
plt.xlabel('Days')
plt.ylabel('No. of crimes')
plt.show()



# In[51]:

#plotting grapgh to see monthly pattern of crimes
procdata.resample('M').size().plot(legend=False)
plt.xlabel('Months')
plt.ylabel('No. of crimes')


# In[77]:

#grouping by Primary type in order to finding out the 5 most prevelant crimes
groupByPrimaryType = newdat.groupby(['Primary Type']).count()
primtype = newdat[['Primary Type']]
groupbyPRIMARYTPE = pd.DataFrame(primtype.groupby('Primary Type').size().sort_values(ascending=False))
groupbyPRIMARYTPE.head(5)


# In[85]:

#grouping by in order to finding out the 5 most prevelant crimes
locdesc = newdat[['Loc Description']]
groupbyLOCATION = pd.DataFrame(locdesc.groupby('Location.Description').size().sort_values(ascending=False))
groupbyLOCATION.head(5)

