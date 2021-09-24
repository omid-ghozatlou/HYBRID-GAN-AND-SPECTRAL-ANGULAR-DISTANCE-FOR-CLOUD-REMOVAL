# -*- coding: utf-8 -*-
"""
Created on Tue Feb 16 14:55:32 2021

@author: CEOSpaceTech
"""

import tifffile
import os, os.path
import numpy as np
#----------------------------- full 12 bands ---------------------------------------
path = "D:/Sciebo/ESR14/cloud removal/dataset/S2B_MSIL2A_20200319T105649_N0214_R094_T31UDQ_20200319T142847.SAFE"
path_stacked = path+'/stacked'
valid_images = [".jpg",".tif",".png",".tga"]
imgs_B2=[]
path_all = path+'/all'
for f in os.listdir(path_all):
    ext = os.path.splitext(f)[1]
    if ext.lower() not in valid_images:
        continue
    imgs_B2.append(tifffile.imread(os.path.join(path_all,f)))


n=1312    
for i in range(n):
    img = np.dstack((imgs_B2[i+3*n],imgs_B2[i+4*n],imgs_B2[i+5*n],imgs_B2[i+6*n],imgs_B2[i+7*n],imgs_B2[i+8*n],imgs_B2[i+9*n],imgs_B2[i+10*n],imgs_B2[i+n],imgs_B2[i+2*n]))
    tifffile.imwrite(path_stacked+"\S2B_MSIL2A_20201124T110359_RGB_"+str(i)+".tif", img, planarconfig='CONTIG')



