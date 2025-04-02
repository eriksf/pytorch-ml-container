FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04
LABEL maintainer="Erik Ferlanti <eferlanti@tacc.utexas.edu>"

# Update OS / Install Python
RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y python3.10-full python3-pip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PyTorch
RUN pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 --index-url https://download.pytorch.org/whl/cu124

# Install Jupyter and useful libraries
RUN pip install pytorch-lightning==2.5.1 \
    transformers==4.50.3 \
    jupyter==1.1.1 \
    h5py==3.13.0 \
    matplotlib==3.10.1 \
    scikit-learn==1.6.1 \
    scikit-image==0.25.2
