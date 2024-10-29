# How to get a Docker Container builder sample?
1. dowanload the DokerContainer
2. change the path in the code to your path
3. open folder in container like the WentingXu3o3/DockContainer_CondaEnv_OnVSCode intrustions.
4. a image called imagetest has been created and attached to the containertest

# How to install NVIDIA GPU inside the docker container? 如何在docker容器中使用nvidia显卡
1. Check your host machine's nvidia gpu installed and configured properly
   ```
   nvidia-smi
   ```
2. if properly, install nvidia-container-toolkit
  ```
  sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
  sudo systemctl restart docker
  ```
3. Run a sample container above to see whether nvidia-smi is enabled? ```nvidia-smi```
4. if 3 not, and saying "Failed to initialize NVML: Unknown Error"
   ```
   sudo vim /etc/nvidia-container-runtime/config.toml
   ```
   change no-cgroups=true to false and save with :wq
   
5. restart docker and try 3
  ```
  sudo systemctl restart docker
  ```
### How to change docker images installation location
1.Stop docker: service docker stop. Verify no docker process is running ps faux

2.Double check docker really isn’t running. Take a look at the current docker directory: ls /var/lib/docker/
2b) Make a backup - tar -zcC /var/lib docker > /mnt/pd0/var_lib_docker-backup-$(date +%s).tar.gz

3.Move the /var/lib/docker directory to your new partition: mv /var/lib/docker /mnt/pd0/docker

4.Make a symlink: ln -s /mnt/pd0/docker /var/lib/docker

5.Take a peek at the directory structure to make sure it looks like it did before the mv: ls /var/lib/docker/ (note the trailing slash to resolve the symlink)

6.Start docker back up service docker start

7.restart your containers
