# ProTECT base Dockerfile for strelka
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/strelka:1.0.15 - < Dockerfile

# Use pimmuno
FROM aarjunrao/pimmuno

# Get strelka and set it up
RUN wget -c ftp://strelka:%27%27@ftp.illumina.com/v1-branch/v1.0.15/strelka_workflow-1.0.15.tar.gz \
    && tar -zxvf strelka_workflow-1.0.15.tar.gz \
    && rm strelka_workflow-1.0.15.tar.gz
RUN cd strelka_workflow-1.0.15 \
    && ./configure --prefix=/opt/strelka \
    && make


WORKDIR /home
# get wrapper_scripts
RUN git clone https://github.com/arkal/toil_docker_wrappers.git
WORKDIR /data
ENTRYPOINT ["bash", "/home/toil_docker_wrappers/strelka_wrapper.sh"]
CMD ["-h"]
