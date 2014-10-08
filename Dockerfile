# Iceweasel/Firefox via VNC

FROM debian:jessie

ENV HOME /root
WORKDIR /root

RUN apt-get update && apt-get install --no-install-recommends -y \
    x11vnc \
    xvfb \
	matchbox-window-manager \
    iceweasel

# VNC
EXPOSE 5900

ENTRYPOINT ["x11vnc", "-forever", "-create", "-afteraccept", "(matchbox-window-manager &) && firefox &"]

CMD ["-noipv6", "-nap", "-nopw"]