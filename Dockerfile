FROM ubuntu:bionic 
MAINTAINER Thomas Vollstädt <tv@engage.de>

COPY dehydrated run.sh config /
RUN chmod +x /run.sh /dehydrated

RUN apt-get update \
 && apt-get install -y \
      curl \
      inotify-tools \
      dns-lexicon

ADD hook.sh /dns/hook
RUN chmod +x /dns/hook

VOLUME ["/letsencrypt"]

ENTRYPOINT ["/bin/bash"]
CMD ["/run.sh"]
