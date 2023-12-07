# Start with the official Tomcat image that includes JDK 8
FROM tomcat:9.0.83-jdk8

# Set the version of the Google Cloud SDK to be installed
ENV CLOUD_SDK_VERSION 375.0.0

# Install necessary tools: curl and python3
RUN apt-get update && \
    apt-get install -y curl python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and set up the Google Cloud SDK
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar -xvf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz -C /usr/local && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

# Add the Google Cloud SDK bin directory to the system PATH
ENV PATH="/usr/local/google-cloud-sdk/bin:${PATH}"