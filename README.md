# HYBRID-GAN-AND-SPECTRAL-ANGULAR-DISTANCE-FOR-CLOUD-REMOVAL
hyperlink https://ieeexplore.ieee.org/abstract/document/9554891
This is the code for paper "Hybrid GAN and Spectral Angular Distances for cloud removal" by Omid Ghozatlou and Mihai Datcu, that aims to apply state of the art of Generative Adversarial Networks to shadow and could removal from Sentinel-2 multispectral images.The code builds on and extends the Cycle-GAN implementation based on Keras. In order to find repository of different kind of GAN on Keras click this link: https://github.com/eriklindernoren/Keras-GAN 
In order to use this script for your dataset it is necessary to stack the multispectral bands. So in this case Stacked12Bands.py is applied on your dataset includes the patches with all bands. After that cyclegan_cloud.py train the GANs using data_loader.py to reach the dataset.
There are script in MATLAB and Python for Polar coordinate transformation and save images as tetas so again needsto stack them by running stacked_tetas.py.
After training we can test the model using Predict.py on test dataset.
According to original scripts the dataset folder has to consist includes 4 subfolders (trainA, trainB, testA, testB)
