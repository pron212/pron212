FROM ubuntu

# update the package repository and install python pip
RUN apt-get -y update && apt-get -y install python3-dev python3-pip

# installing flower
RUN pip install flower

# Make sure we expose port 5555 so that we can connect to it
EXPOSE 5555

# Running flower
ENTRYPOINT ["flower", "--port=5555"]
