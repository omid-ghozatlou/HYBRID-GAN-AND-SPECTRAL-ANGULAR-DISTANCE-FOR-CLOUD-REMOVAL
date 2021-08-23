# -*- coding: utf-8 -*-
"""
Created on Thu Jan 14 10:16:52 2021

@author: CEOSpaceTech
"""

# from tensorflow import
import keras 
import os, os.path
from os import makedirs
import numpy as np
# from imageio import imread
import keras_contrib
from keras_contrib.layers.normalization.instancenormalization import InstanceNormalization

from tifffile import imread, imwrite
from skimage.transform import resize

# load model saved in which directory and set epoch number
reconstructed_model = keras.models.load_model("results_baseline/rgb/g_AB_model_118.h5", custom_objects={'InstanceNormalization':keras_contrib.layers.InstanceNormalization})

path = "D:/Omid/UPB/Cloud_removal/Hybrid GAN & SAD/datasets/rgb/t" # test dataset directory
makedirs('results/rgb/ttt', exist_ok=True) 
path_save = "D:/Omid/UPB/Cloud_removal/Hybrid GAN & SAD/results/rgb/ttt"
img_res=(128, 128)
#------------------------ whole test dataset---------------------
valid_images = [".jpg",".tif",".png",".tga"]

files_in_testA = sorted(os.listdir(path))
for f in files_in_testA:
    ext = os.path.splitext(f)[1]
    if ext.lower() not in valid_images:
        continue  
    img = imread(os.path.join(path,f))
    img = resize(img, img_res)
    #-----------subset normalizing & scaling (12 bands & 4 bands) ------------------
    # img = img/8000 # subset normalization
    # b = np.where((img > 1))
    # img[b[0],b[1],b[2]]=1 
    # img = img/(0.5) -1.   # RGB_subnorm
    #--------------teta ---------------
    # img = 4*img/(np.pi) -1.
    #---------- tetas scaling -----------------
    # img = img/(0.5*np.pi) -1.
    # ---------------- scaling uint8-----------
    img = img/(127.5) -1.
    im = np.expand_dims(img, axis=0)
    results = reconstructed_model.predict(im)
    imwrite(path_save+"\\result_120_"+ f, np.squeeze(results, axis=0), planarconfig='CONTIG')

#---------------------- specific data -------------------------
# img_res=(128, 128)

# # sample='D:/Omid/UPB/Cloud_removal/Hybrid GAN & SAD/images/Paris_12bands_32gf/input_119_450.tif'
# # cloud = imread(sample)

# cloudy_image = 'S2B_MSIL2A_20200218T110009_RGB_666'
# cloudy = imread(os.path.join(path,cloudy_image))
# cloud_resized = resize(cloudy, img_res)
# cloud = np.expand_dims(cloud_resized, axis=0)
# CloudFree = reconstructed_model.predict(cloud)
# translated = np.squeeze(CloudFree, axis=0)
# # translated = 0.5 * translated + 0.5
# # imwrite(path_save+"\\input_" +str(cloudy_image)+".tif", cloud_resized, planarconfig='CONTIG')
# imwrite(path_save+"\\result_119-450_64gf_epoch30.tif", translated, planarconfig='CONTIG')
