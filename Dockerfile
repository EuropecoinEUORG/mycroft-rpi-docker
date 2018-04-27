FROM resin/rpi-raspbian:jessie
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y gnupg2 apt-transport-https build-essential alsa-utils sox
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F3B1AA8B
RUN echo deb https://repo.mycroft.ai/repos/apt/debian debian main >/etc/apt/sources.list.d/mycroft.list
RUN apt-get update
RUN apt-get install -y mycroft-core libicu52
RUN cd /usr/local/lib/python2.7/site-packages/mycroft_core-*.egg && mkdir msm
RUN cd /usr/local/lib/python2.7/site-packages/mycroft_core-*.egg && ln -sf /usr/local/bin/msm msm/msm
COPY mycroft.sh /usr/local/bin/
ENV VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
RUN pip install virtualenvwrapper
RUN ln -sf /usr/local/bin/virtualenvwrapper.sh /usr/bin
USER mycroft
CMD /usr/local/bin/mycroft.sh
