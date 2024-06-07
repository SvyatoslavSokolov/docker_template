# Base image for Docker container with NVIDIA PyTorch version 23.12 and Python 3
FROM nvcr.io/nvidia/pytorch:23.12-py3

# Set the DEBIAN_FRONTEND environment variable to noninteractive to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list in the Docker container
RUN apt-get -y update

# Install python3-pip package to enable pip, the Python package installer
RUN apt-get -y install python3-pip

# Upgrade pip to the latest version using pip itself
RUN /usr/bin/python3 -m pip install --upgrade pip

# Use pip to install timm, a popular library for efficient image models
RUN pip install timm

# Define the default command to run when starting a container from this Dockerfile. This will start Jupyter Notebook server listening on all interfaces (0.0.0.0) and port 8888
CMD ["jupyter", "notebook", "--port=8888", "--ip=0.0.0.0"]