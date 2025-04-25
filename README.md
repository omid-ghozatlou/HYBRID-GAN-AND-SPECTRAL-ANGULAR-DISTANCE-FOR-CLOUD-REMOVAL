# HYBRID-GAN-AND-SPECTRAL-ANGULAR-DISTANCE-FOR-CLOUD-REMOVAL

## Overview

This project implements a hybrid approach using Generative Adversarial Networks (GANs) and Spectral Angular Distance for cloud removal in images. The goal is to enhance image quality by effectively removing cloud cover. This code is based on the paper [Hybrid GAN and Spectral Angular Distances for cloud removal](https://ieeexplore.ieee.org/abstract/document/9554891) by Omid Ghozatlou and Mihai Datcu.

flowchart TD
    %% Data Storage
    subgraph "Data Storage"
        direction TB
        RawData["Raw Multispectral Images\n(trainA, trainB, testA, testB)"]:::dataStorage
        ProcessedData["Processed Datasets\n(.npy stacks, polar images)"]:::dataStorage
    end

    %% Preprocessing Layer
    subgraph "Preprocessing" 
        direction TB
        BandStacking["Band Stacking Module\n(Stacked12Bands.py)"]:::preprocess
        MATLABPolar["Polar Conversion (MATLAB)\n(images_2_Polar.m)"]:::preprocess
        PyPolar["Polar Conversion (Python)\n(PolarCoordinates_method_modified.py)"]:::preprocess
        PatchAssembly["Patch Assembly Module\n(stacked_tetas.py)"]:::preprocess
    end

    %% Data Loader
    DataLoader["Data Loader Module\n(data_loader.py)"]:::preprocess

    %% Model Training
    subgraph "Model Training" 
        direction TB
        Training["Training Driver\n(cyclegan_cloud.py)"]:::training
        SADModule["Spectral Angular Distance Module"]:::training
        Checkpoint["Checkpoint & Logging"]:::training
        SavedModel["Saved Model\n(.h5, checkpoints)"]:::training
    end

    %% Inference
    subgraph "Model Inference & Output"
        direction TB
        Inference["Inference Script\n(Predict.py)"]:::inference
        Outputs["Cloud-Removed Images"]:::inference
    end

    %% External Dependencies
    subgraph "External Dependencies"
        direction TB
        MATLABEngine["MATLAB Engine API"]:::external
        PythonLibs["Python Libraries\n(TensorFlow/Keras, NumPy, etc.)"]:::external
        Requirements["requirements.txt"]:::external
        README["README.md"]:::external
    end

    %% Connections
    RawData -->|"stack raw data"| BandStacking
    BandStacking -->|"stacked_images.npy"| MATLABPolar
    MATLABPolar -->|"polar_images.mat"| PyPolar
    PyPolar -->|"polar_patches.npy"| PatchAssembly
    PatchAssembly -->|"training_patches"| DataLoader
    DataLoader -->|"batches"| Training
    Training -->|"model_weights"| SavedModel
    SavedModel -->|"trained_model"| Inference
    RawData -->|"test data"| Inference
    Inference -->|"predictions"| Outputs

    %% External Links
    MATLABEngine -.-> MATLABPolar
    PythonLibs -.-> DataLoader
    PythonLibs -.-> Training
    PythonLibs -.-> Inference

    %% Click Events
    click BandStacking "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/Stacked12Bands.py"
    click MATLABPolar "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/images_2_Polar.m"
    click PyPolar "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/PolarCoordinates_method_modified.py"
    click PatchAssembly "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/stacked_tetas.py"
    click DataLoader "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/data_loader.py"
    click Training "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/cyclegan_cloud.py"
    click Inference "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/Predict.py"
    click Requirements "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/requirements.txt"
    click README "https://github.com/omid-ghozatlou/hybrid-gan-and-spectral-angular-distance-for-cloud-removal/blob/main/README.md"

    %% Styles
    classDef dataStorage fill:#bbdefb,stroke:#1e88e5,color:#0d47a1;
    classDef preprocess fill:#c8e6c9,stroke:#43a047,color:#1b5e20;
    classDef training fill:#ffcdd2,stroke:#e53935,color:#b71c1c;
    classDef inference fill:#ffe0b2,stroke:#fb8c00,color:#e65100;
    classDef external fill:#f5f5f5,stroke:#9e9e9e,color:#616161,stroke-dasharray: 5 5;

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
