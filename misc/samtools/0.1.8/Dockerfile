# ProTECT Dockerfile for samtools:0.1.8
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/samtools:0.1.8 - < Dockerfile
# Run with sudo docker run -v <IO_folder>:/data aarjunrao/samtools:0.1.8 <parameters>

# Use pimmuno
FROM aarjunrao/pimmuno

# Get samtools
RUN git clone https://www.github.com/samtools/samtools.git \
    && cd samtools \
    && git checkout tags/0.1.8 -b samtools-0.1.8 \
    && make \
    && cp samtools /usr/local/bin/

# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["sh", "/home/toil_docker_wrappers/samtools_wrapper.sh"]