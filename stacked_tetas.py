# -*- coding: utf-8 -*-
"""
Created on Fri Jan 22 09:57:57 2021

@author: CEOSpaceTech
"""




# D:/Omid/UPB/Datasets/Paris/Full Bands
import scipy.io
import pickle
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
from tifffile import imread, imwrite
from skimage.transform import resize
import imageio
# I = 'D:/Omid/UPB/Datasets/Paris/Full Bands/subset_0_of_S2A_MSIL2A_20201109T110301_N0214_R094_T31UDQ_20201109T135058.tif'
# II = 'D:/Omid/UPB/Cloud removal/Keras-GAN-master/cyclegan/datasets/apple2orange/testA/n07740461_601.jpg'

# III = 'D:/Omid/UPB/Cloud removal/Keras-GAN-master/cyclegan/datasets/Paris_vis/testA/S2B_MSIL2A_20200218T110009_RGB_799.png'
# oo='C:/Users/CEOSpaceTech/Downloads/Presentation1.tif'

# image_A ='D:/Omid/UPB/Datasets/Paris/Full Bands/20200215/stacked/stacked_4.tiff'
# batch_size=1

# is_testing=False
# img_res=(128,128,11)


# img = tifffile.imread(image_A).astype(np.float)
# img = img.reshape((366,366,11))
# img_B = resize(img, img_res)
# tifffile.imsave("stacked_reeeesized.tif", img_B.reshape((11,128,128)))
path_stacked = "D:/Omid/UPB/Datasets/Paris/128x128 batches/Full_Bands_128/Teta"
# mat1 = scipy.io.loadmat('teta.mat/ro_20200215.mat')
# Teta_20200215 = mat1['ro']
# mat2 = scipy.io.loadmat('teta.mat/ro_20200218.mat')
# Teta_20200218 = mat2['ro']
mat3 = scipy.io.loadmat('teta.mat/tetas_20200218.mat')
Teta_20201124 = mat3['Teta']

# mat2 = scipy.io.loadmat('teta.mat/Teta_2.mat')
# Teta2 = mat2['tet2']
# mat3 = scipy.io.loadmat('teta.mat/Teta_3.mat')
# Teta3 = mat3['tet3']
# mat4 = scipy.io.loadmat('teta.mat/Teta_4.mat')
# Teta4 = mat4['tet4']
# mat5 = scipy.io.loadmat('teta.mat/Teta_5.mat')
# Teta5 = mat5['tet5']
# mat6 = scipy.io.loadmat('teta.mat/Teta_6.mat')
# Teta6 = mat6['tet6']
# mat7 = scipy.io.loadmat('teta.mat/Teta_7.mat')
# Teta7 = mat7['tet7']
# mat8 = scipy.io.loadmat('teta.mat/Teta_8.mat')
# Teta8 = mat8['tet8']
# mat9 = scipy.io.loadmat('teta.mat/Teta_9.mat')
# Teta9= mat9['tet9']
# mat10 = scipy.io.loadmat('teta.mat/Teta_10.mat')
# Teta10 = mat10['tet10']
# mat11 = scipy.io.loadmat('teta.mat/Teta_11.mat')
# Teta11 = mat11['tet11']

# for i in range(len(Teta1)):
#     img = np.dstack((Teta1[i],Teta2[i],Teta3[i],Teta4[i],Teta5[i],Teta6[i],Teta7[i],Teta8[i],Teta9[i],Teta10[i],Teta11[i]))
#     imwrite(path+"\Teta_"+str(i+580)+".tif", img, planarconfig='CONTIG')

n=1312    
for i in range(n):
    # imwrite(path_stacked+"\S2B_MSIL2A_20200215T105029_RGB_"+str(i)+".tif", Teta_20200215[i], planarconfig='CONTIG')
    # imwrite(path_stacked+"\S2B_MSIL2A_20200218T110009_RGB_"+str(i)+".tif", Teta_20200218[i], planarconfig='CONTIG')
    imwrite(path_stacked+"\S2B_MSIL2A_20200218T110009_RGB_"+str(i)+".tif", Teta_20201124[i], planarconfig='CONTIG')


