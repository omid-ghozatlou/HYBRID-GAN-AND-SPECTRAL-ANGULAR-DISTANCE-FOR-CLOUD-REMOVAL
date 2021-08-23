# -*- coding: utf-8 -*-
"""
Created on Tue Feb 16 14:55:32 2021

@author: CEOSpaceTech
"""


import tifffile
# from PIL import Image
import os, os.path
import numpy as np
#----------------------------- full 12 bands ---------------------------------------
# path = "D:/Omid/UPB/Datasets/Paris/128x128 batches/Full_Bands_128/S2B_MSIL2A_20200319T105649_N0214_R094_T31UDQ_20200319T142847.SAFE"
# path_stacked = path+'/Stacked'
# valid_images = [".jpg",".tif",".png",".tga"]
# imgs_B2=[]
# path_all = path+'/all'
# for f in os.listdir(path_all):
#     ext = os.path.splitext(f)[1]
#     if ext.lower() not in valid_images:
#         continue
#     imgs_B2.append(tifffile.imread(os.path.join(path_all,f)))


# n=1312    
# for i in range(n):
#     img = np.dstack((imgs_B2[i],imgs_B2[i+3*n],imgs_B2[i+4*n],imgs_B2[i+5*n],imgs_B2[i+6*n],imgs_B2[i+7*n],imgs_B2[i+8*n],imgs_B2[i+9*n],imgs_B2[i+10*n],imgs_B2[i+11*n],imgs_B2[i+n],imgs_B2[i+2*n]))
#     tifffile.imwrite(path_stacked+"\S2B_MSIL2A_20200319T105649_RGB_"+str(i)+".tif", img, planarconfig='CONTIG')

#----------------------------------- 10 bands 10m & 20m (subset normalization 8000) --------------------------------------
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
    img = img/8000    # for subset normalization 8000 for TCI 2000
    img = np.where(img < 1, img, 1)
    img = img*255     # unit8
    tifffile.imwrite(path_stacked+"\S2B_MSIL2A_20201124T110359_RGB_"+str(i)+".tif", img, planarconfig='CONTIG')

#------------------------------IR & RGB ----------------------------------------
# path = "D:/Omid/UPB/Datasets/Paris/128x128 batches/Full_Bands_128/S2B_MSIL2A_20200215T105029_N0214_R051_T31UDQ_20200215T132945.SAFE"
# path_stacked = path+'/4Bands'
# valid_images = [".jpg",".tif",".png",".tga"]
# imgs_B2=[]
# path_all = path+'/all'
# for f in os.listdir(path_all):
#     ext = os.path.splitext(f)[1]
#     if ext.lower() not in valid_images:
#         continue
#     imgs_B2.append(tifffile.imread(os.path.join(path_all,f)))


# n=1312    
# for i in range(n):
#     img = np.dstack((imgs_B2[i+3*n],imgs_B2[i+4*n],imgs_B2[i+5*n],imgs_B2[i+9*n]))
#     tifffile.imwrite(path_stacked+"\S2B_MSIL2A_20200215T105029_RGB_"+str(i)+".tif", img, planarconfig='CONTIG')

#--------------------------------   RGB (subset normalization 8000) --------------------------------------------------
# path = "D:/Omid/UPB/Datasets/Paris/128x128 batches/Full_Bands_128/S2B_MSIL2A_20201124T110359_N0214_R094_T31UDQ_20201124T130206.SAFE"
# path_stacked = path+'/TCI'
# valid_images = [".jpg",".tif",".png",".tga"]
# imgs_B2=[]
# path_all = path+'/all'
# for f in os.listdir(path_all):
#     ext = os.path.splitext(f)[1]
#     if ext.lower() not in valid_images:
#         continue
#     imgs_B2.append(tifffile.imread(os.path.join(path_all,f)))


# n=1312    
# for i in range(n):
#     img = np.dstack((imgs_B2[i+3*n],imgs_B2[i+4*n],imgs_B2[i+5*n]))
#     img = img/2000    # for subset normalization 8000 for TCI 2000
    # b = np.where((img > 1)) #img = np.where(img < 1, img, 1)
    # img[b[0],b[1],b[2]]=1  
    # img = img*255     # unit8
#     tifffile.imwrite(path_stacked+"\S2B_MSIL2A_20201124T110359_RGB_"+str(i)+".tif", img, planarconfig='CONTIG')
#     # cv2.imwrite(path_stacked+"\S2B_MSIL2A_20200218T110009_RGB_"+str(i)+".png", img) # destroy hostogram
