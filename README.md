# How to get a Docker Container builder sample?
1. dowanload the DokerContainer
2. change the path in the code to your path
3. open folder in container like the WentingXu3o3/DockContainer_CondaEnv_OnVSCode intrustions.
4. a image called imagetest has been created and attached to the containertest

#How to install NVIDIA GPU inside the docker container? 如何在docker容器中使用nvidia显卡
1. Check your host machine's nvidia gpu installed and configured properly
   ```
   nvidia-smi
   ```
2. if properly, install nvidia-container-toolkit
  ```
  sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
  sudo systemctl restart docker
  ```
3. Run a sample container above to see whether nvidia-smi is enabled?
4. if 3 not, and saying "Failed to initialize NVML: Unknown Error"
   ```
   sudo vim /etc/nvidia-container-runtime/config.toml
   ```
    change no-cgroups=true to false
   save with :wq
  restart docker
  ```
  sudo systemctl restart docker
  ```
