import numpy as np
import sys as s
import os

# os.environ['sortOrder'] = 'desc'
arr_len = int(s.argv[1])
arr = np.empty(arr_len, dtype = int) 
print('Array of random numbers', arr)
arr = np.sort(arr) if os.environ['SORTORDER'] == 'asc' else np.sort(arr)[::-1]
print('After sorting in ', os.environ['SORTORDER'], ' order ', arr)

