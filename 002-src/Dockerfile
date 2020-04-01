# this is our first build stage, it will not persist in the final image
FROM gcr.io/crucial-minutia-227720/chipyard-centos7-reqs as intermediate

ADD id_rsa /root/.ssh/id_rsa

# Set up credentials  
RUN mkdir -p /root/.ssh && \
	touch /root/.ssh/known_hosts && \
  ssh-keyscan github.com >> /root/.ssh/known_hosts && \
  chmod 400 /root/.ssh/id_rsa 

# Clone our private repo 
RUN git clone git@github.com:QuarantineGemmini/chipyard.git && \
  cd chipyard && \
  ./scripts/init-submodules-no-riscv-tools.sh && \
  git submodule update --init --recursive toolchains/esp-tools 

##source sourceme.sh && \
##  ./scripts/build-toolchains.sh esp-tools 

# Now make our real, secret-free image 	
FROM gcr.io/crucial-minutia-227720/chipyard-centos7-reqs 
# copy the repository from the previous image
COPY --from=intermediate /chipyard /chipyard 


