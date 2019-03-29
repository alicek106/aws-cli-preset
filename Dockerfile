FROM ubuntu:16.04
COPY sources.list /etc/apt/sources.list
RUN apt update && \
  apt install python python-pip curl groff vim -y && \
  apt clean autoclean && \
  apt autoremove --yes && \
  rm -rf /var/lib/{apt,dpkg,cache,log} && \
  rm -rf /var/www/html/index.html

RUN curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin/

RUN curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x aws-iam-authenticator && \
  mv aws-iam-authenticator /usr/bin/

RUN pip install awscli --upgrade
