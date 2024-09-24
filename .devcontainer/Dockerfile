# 1.
FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel
RUN apt-get update && apt-get install -y \
    git
CMD ["/bin/bash"] 
# 2.
FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel
RUN apt-get update && apt-get install -y \
    git \
    libsparsehash-dev

RUN pip install --upgrade git+https://github.com/mit-han-lab/torchsparse.git@v1.4.0

RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Create the environment:
COPY environment.yaml ./ 
#really important and couldn't be comment
RUN conda env create -n conenvtest -f environment.yaml
 
SHELL ["/bin/bash", "-c"]
 
# RUN echo "source activate conenvtest" > ~/.bashrc 
#conda environment will be activated every time you enter the container
# ENV PATH /opt/conda/envs/conenvtest/bin:$PATH 
#Conda environment, ensuring that executables from that environment are found first when running commands within the container.
#ENV PATH /opt/conda/envs

# PATH = [a, b, c, d]
# PATH = [/opt/conda/envs/env/bin, ...PATH]
# PATH = [/opt/conda/envs/env/bin, a, b, c, d]
# PATH = [/opt/conda/envs/env/bin]
 
CMD ["/bin/bash"] 
