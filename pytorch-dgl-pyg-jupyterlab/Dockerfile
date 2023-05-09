FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu20.04

# Set bash as the default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /pytorch

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    python3-pip \
    apt-utils \
    tmux \
    vim \
    git \
    wget

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

# install jupyterlab
RUN mkdir /opt/notebooks \
    && pip install jupyterlab \
    && jupyter lab --generate-config \
    && chmod -R 777 /root/.jupyter/jupyter_lab_config.py \
    && chmod -R 777 /opt/notebooks \
    && pip install jupyterlab-language-pack-zh-CN \
    && pip install jupyterlab-lsp==3.2.0 jupyter-lsp==1.1.1 \
    && pip install jupyterlab_code_formatter \
    && pip install python-language-server[all] \
    && pip install black isort

# install tqdm, numba, matplotlib, sklearn, pandas
RUN pip install tqdm numba matplotlib scikit-learn Pandas

# install pytorch
RUN pip install torch==1.13.1+cu117 --extra-index-url https://download.pytorch.org/whl/cu117

# install dgl
RUN pip install  dgl -f https://data.dgl.ai/wheels/cu117/repo.html \
    pip install  dglgo -f https://data.dgl.ai/wheels-test/repo.html

# install pyg
RUN pip install torch_geometric \
    pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-1.13.0+cu117.html

# start jupyter lab
CMD jupyter lab --notebook-dir=/pytorch --ip='*' --NotebookApp.token='' --port=8888 --allow-root --no-browser
