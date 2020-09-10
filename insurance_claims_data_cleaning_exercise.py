# -*- coding: utf-8 -*-
"""insurance_claims_data_cleaning_exercise.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1o5WOp-C29h3ngHidrkXNcBC_VH5-bOJz
"""

from google.colab import files
data_to_load = files.upload()

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sklearn
import seaborn as sns

import io
df = pd.read_csv(io.BytesIO(data_to_load['HD Risk Pricing Analyst - cleaned data.csv']))

df2 = df.drop(['Loss_code','Loss_description',],axis=1)
df2

df3 = df2[df2[' Incurred ']>=0]

df3

print(list(df2.columns.values))

print(df3['Notifier'].unique())
print(df3['Location_of_incident'].unique())
print(df3['Weather_conditions'].unique())
print(df3['Vehicle_mobile'].unique())
print(df3['Main_driver'].unique())
print(df3['PH_considered_TP_at_fault'].unique())

pure_numeric_df=df3.replace({'Notifier': ('CNF' ,'PH', 'Other', 'TP', 'NamedDriver')},{'Notifier': (1,0,3,4,2)})
pure_numeric_df=pure_numeric_df.replace({'Location_of_incident': ('Main Road', 'Other' ,'Minor Road' ,'Not Applicable', 'Home Address', 'n/k',
 'Car Park', 'Motorway')},{'Location_of_incident': (6,2,5,1,4,0,3,7)})
pure_numeric_df=pure_numeric_df.replace({'Weather_conditions': ('WET', 'N/K' ,'NORMAL' ,'Not Applicable', 'SNOW,ICE,FOG')},{'Weather_conditions': (3,0,2,1,4)})
pure_numeric_df=pure_numeric_df.replace({'Vehicle_mobile': ('Y', 'N' ,'n/k')},{'Vehicle_mobile': (2,0,1)})
pure_numeric_df=pure_numeric_df.replace({'PH_considered_TP_at_fault': ('Y', 'N' ,'n/k')},{'PH_considered_TP_at_fault': (2,0,1)})
pure_numeric_df=pure_numeric_df.replace({'Main_driver': ('Y', 'N' ,'Other')},{'Main_driver': (2,0,1)})

pure_numeric_df

pure_numeric_df.describe(include='all')

pure_numeric_df[[' Incurred ',' Capped Incurred ','Notifier', 'Notification_period', 'Inception_to_loss', 'Location_of_incident', 'Weather_conditions', 'Vehicle_mobile', 'Time_hour', 'Main_driver', 'PH_considered_TP_at_fault', ' Vechile_registration_present ', ' Incident_details_present ', ' Injury_details_present ', ' TP_type_insd_pass_back ', ' TP_type_insd_pass_front ', ' TP_type_driver ', ' TP_type_pass_back ', ' TP_type_pass_front ', ' TP_type_bike ', ' TP_type_cyclist ', ' TP_type_pass_multi ', ' TP_type_pedestrian ', ' TP_type_other ', ' TP_type_nk ', ' TP_injury_whiplash ', ' TP_injury_traumatic ', ' TP_injury_fatality ', ' TP_injury_unclear ', ' TP_injury_nk ', ' TP_region_eastang ', ' TP_region_eastmid ', ' TP_region_london ', ' TP_region_north ', ' TP_region_northw ', ' TP_region_outerldn ', ' TP_region_scotland ', ' TP_region_southe ', ' TP_region_southw ', ' TP_region_wales ', ' TP_region_westmid ', ' TP_region_yorkshire ']].corr()

df3['Number of claims']=df3['Claim Number']*0+1
grouped_by_day_df3=df3.groupby(['date_of_loss'],as_index=False).sum()
grouped_by_day_df3['Date'] = pd.to_datetime(grouped_by_day_df3['date_of_loss'])

f, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize =(15,15))
ax1.plot_date(grouped_by_day_df3['Date'],grouped_by_day_df3[' Incurred '],xdate=True)
ax1.set_title('Incurred vs Date',fontsize=15)
ax1.set_ylabel('Incurred')
ax2.plot_date(grouped_by_day_df3['Date'],grouped_by_day_df3[' Capped Incurred '],xdate=True)
ax2.set_title('Capped Incurred vs Date',fontsize=15)
ax2.set_ylabel('Capped Incurred')
ax3.plot_date(grouped_by_day_df3['Date'],grouped_by_day_df3['Number of claims'],xdate=True)
ax3.set_title('Number of claims per day vs Date',fontsize=15)
ax3.set_ylabel('Number of claims')
plt.show()

weather_data=pure_numeric_df[[' Incurred ','Notifier', 'Location_of_incident', ' TP_injury_fatality ',  ' TP_injury_nk ',  ' TP_region_outerldn ',   ' TP_region_southe ', ' TP_region_yorkshire ']]
sns.pairplot(weather_data);