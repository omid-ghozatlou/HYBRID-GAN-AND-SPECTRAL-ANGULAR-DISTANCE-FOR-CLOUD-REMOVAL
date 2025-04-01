# HYBRID-GAN-AND-SPECTRAL-ANGULAR-DISTANCE-FOR-CLOUD-REMOVAL

## Overview

This project implements a hybrid approach using Generative Adversarial Networks (GANs) and Spectral Angular Distance for cloud removal in images. The goal is to enhance image quality by effectively removing cloud cover. This code is based on the paper [Hybrid GAN and Spectral Angular Distances for cloud removal](https://ieeexplore.ieee.org/abstract/document/9554891) by Omid Ghozatlou and Mihai Datcu.

## Features

- Hybrid GAN architecture for cloud removal
- Utilizes Spectral Angular Distance for improved accuracy
- Easy to use and integrate into existing workflows

## Installation

To set up the project, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/omid-ghozatlou/HYBRID-GAN-AND-SPECTRAL-ANGULAR-DISTANCE-FOR-CLOUD-REMOVAL.git
   cd HYBRID-GAN-AND-SPECTRAL-ANGULAR-DISTANCE-FOR-CLOUD-REMOVAL
   ```

2. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

To run the cloud removal process, use the following command:

```bash
python main.py --input <input_image_path> --output <output_image_path>
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Citation

If you use this code in your research, please cite our paper:

```bibtex
@INPROCEEDINGS{9554891,
  author={Ghozatlou, Omid and Datcu, Mihai},
  booktitle={2021 IEEE International Geoscience and Remote Sensing Symposium IGARSS}, 
  title={Hybrid Gan and Spectral Angular Distance for Cloud Removal}, 
  year={2021},
  volume={},
  number={},
  pages={2695-2698},
  keywords={Deep learning;Training;Satellites;Image recognition;Clouds;Lighting;Geoscience and remote sensing;Cloud Removal;Generative Adversarial Networks (GANs);Polar Coordinates;Multispectral Satellite Images},
  doi={10.1109/IGARSS47720.2021.9554891}}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This is the code for paper
[Hybrid GAN and Spectral Angular Distances for cloud removal](https://ieeexplore.ieee.org/abstract/document/9554891)
by Omid Ghozatlou and Mihai Datcu, that aims to apply state of the art of Generative Adversarial Networks to shadow and could removal from Sentinel-2 multispectral images.The code builds on and extends the Cycle-GAN implementation based on Keras. In order to find repository of different kind of GAN on Keras click this link: https://github.com/eriklindernoren/Keras-GAN
In order to use this script for your dataset it is necessary to stack the multispectral bands. So in this case Stacked12Bands.py is applied on your dataset includes the patches with all bands. After that cyclegan_cloud.py train the GANs using data_loader.py to reach the dataset.
There are script in MATLAB and Python for Polar coordinate transformation and save images as tetas so again needsto stack them by running stacked_tetas.py.
After training we can test the model using Predict.py on test dataset.
According to original scripts the dataset folder has to consist includes 4 subfolders (trainA, trainB, testA, testB)
