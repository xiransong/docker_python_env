sudo docker run --rm -it --gpus all --ipc=host \
  -v /media/xreco/DEV/xiran:/pytorch/xiran \
  -p 8888:8888 \
  pytorch-dgl-pyg-jupyterlab:v0 \
