FROM csmith/letsencrypt-generic:latest
MAINTAINER Chris Smith <dke@chameth.com> 

RUN apt-get update \
 && apt-get install -y \
      inotify-tools \
      python3 \
      python3-pip

RUN pip3 install \
      dns-lexicon==3.2.8

ADD hook.sh /dns/hook
RUN chmod +x /dns/hook

