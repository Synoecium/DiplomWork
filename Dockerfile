
# Copy the packaged files into a container image that includes CUDA but doesn't include any Unreal Engine components
FROM adamrehn/ue4-runtime:latest
COPY --chown=ue4:ue4 Template3dp427/. /home/ue4/project/

# Enable the NVIDIA driver capabilities required by the NVENC video encoding API
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},video

# Create a symbolic link to the path where libnvidia-encode.so.1 will be mounted, since UE4 seems to ignore LD_LIBRARY_PATH
RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-encode.so /home/ue4/project/Template3dp427PS/Binaries/Linux/libnvidia-encode.so

# Set the packaged project as the container's entrypoint
ENTRYPOINT ["/home/ue4/project/Template3dp427PS.sh", "-AudioMixer", "-opengl4", "-RenderOffScreen"]


