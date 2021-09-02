# -*- coding: utf-8 -*-
"""
Created on Thu Jan 14 10:16:52 2021

@author: CEOSpaceTech
"""

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

path = "./datasets/rgb/t" # test dataset directory
makedirs('results/rgb/ttt', exist_ok=True) 
path_save = "./results/rgb/ttt"
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
    # ---------------- scaling uint8-----------
    img = img/(127.5) -1.
    im = np.expand_dims(img, axis=0)
    results = reconstructed_model.predict(im)
    imwrite(path_save+"\\result_120_"+ f, np.squeeze(results, axis=0), planarconfig='CONTIG')

