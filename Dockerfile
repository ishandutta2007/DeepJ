FROM nvidia/cuda:9.1-base-ubuntu16.04

# Install Python & dependencies
RUN \
  apt-get update && \
  apt-get install -y bzip2 fluidsynth curl lame protobuf-compiler libprotoc-dev && \
  curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh && \
  bash /tmp/miniconda.sh -bfp /usr/local && \
  rm -rf /tmp/miniconda.sh

# Install CONDA deps
RUN conda install -y python==3.6 && \ 
    conda install -y -c anaconda tk && \
    conda install -y -c conda-forge onnx

COPY requirements.txt /tmp/

# Install app dependencies
RUN pip install --no-cache-dir -r /tmp/requirements.txt

CMD ["bash"]