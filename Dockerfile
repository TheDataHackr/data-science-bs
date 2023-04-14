# Use the following process to build the docker image:
#  cd into the directory containing the Dockerfile from the Terminal and run the following line:
#  Windows/Mac OSX:
#    docker build -t dsbs-python -f Dockerfile .
#  Linux:
#    docker build -t dsbs-python --build-arg UID=$(id -u) --build-arg UNAME=$(whoami) --build-arg GID=$(id -g) --build-arg GNAME=$(whoami) -f Dockerfile .
#
#  To start the container and get a command prompt:
#    Windows/Mac OSX:
#      docker run -v "C:\Users\username\path\to\data-science-bs":/opt/project -it dsbs-python bash
#    Linux:
#      docker run -v /home/username/path/to/data-science-bs:/opt/project -it dsbs-python bash
#
#  For Debugging:
#    Run with: python code.py (using breakpoint() inside the code --> drops to ipdb)
#      Once inside ipdb, use:
#        from IPython import embed; embed(user_ns=locals(), colors='neutral')

# Set the base image
FROM python:3.9.16-bullseye

# author
MAINTAINER Scott W. Strong

# extra metadata
LABEL version="1.0"
LABEL description="Debian Bullseye Python 3.9.16 environment for data-science-bs"

# Uncomment this section for running on Linux
#ARG UID
#ARG UNAME
#ARG GID
#ARG GNAME
#RUN groupadd -f -g $GID $GNAME
#RUN useradd -ms /bin/bash -g $GID -u $UID $UNAME
#RUN echo "$UNAME  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
#USER $UID:$GID

ENV PYTHONPATH=/opt/project
ENV PYTHONBREAKPOINT="ipdb.set_trace"

ADD ./provision/requirements.txt /
RUN pip3 install -r /requirements.txt

CMD tail -f /dev/null