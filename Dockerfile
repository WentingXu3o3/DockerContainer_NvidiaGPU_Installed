FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel
RUN apt-get update && apt-get install -y \
    git \
    libsparsehash-dev

RUN pip install --upgrade git+https://github.com/mit-han-lab/torchsparse.git@v1.4.0

RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Create the environment:
COPY environment.yaml ./
RUN conda env create -n dsg_3d -f environment.yaml
 
SHELL ["/bin/bash", "-c"]
 
# RUN echo "source activate pytorch-gpu" > ~/.bashrc
#ENV PATH /opt/conda/envs/env/bin:$PATH
#ENV PATH /opt/conda/envs

# PATH = [a, b, c, d]
# PATH = [/opt/conda/envs/env/bin, ...PATH]
# PATH = [/opt/conda/envs/env/bin, a, b, c, d]
# PATH = [/opt/conda/envs/env/bin]
 
CMD ["/bin/bash"] 
