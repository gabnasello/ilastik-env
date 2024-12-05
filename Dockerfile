FROM gnasello/fiji-env:2024-07-16.1

# Configure environment
ENV DOCKER_IMAGE_NAME='ilastik-env'
ENV VERSION='2024-12-04' 

# ports and volumes
EXPOSE 3000

VOLUME /config

# title
ENV TITLE=Ilastik

# Download the Ilastik file 
RUN wget https://files.ilastik.org/ilastik-1.4.0.post1-Linux.tar.bz2 && \
    mkdir /ilastik && tar -xvjf ilastik-1.4.0.post1-Linux.tar.bz2 --strip-components=1 -C /ilastik && \
    rm ilastik*.tar.bz2

RUN chmod 777 -R /ilastik

COPY /desktop/ilastik.desktop /usr/share/applications/
COPY /desktop/ilastik.desktop /config/Desktop/
RUN chmod 777 /config/Desktop/ilastik.desktop