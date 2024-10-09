# AIP Clustering

## Setup

```
docker build -t aip-clustering-container .
docker run -it --gpus all --rm --name aip-clustering-container -p 8888:8888 --shm-size=8g -v ${PWD}/aip-clustering:/workspace/aip-clustering aip-clustering-image
```

## Usage

