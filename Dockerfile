# Iceweasel/Firefox via VNC

FROM debian:jessie

RUN apt-get update && apt-get install --no-install-recommends -y \
    x11vnc \
    xvfb \
	matchbox-window-manager \
    iceweasel

EXPOSE 5900

CMD x11vnc -nopw -nap -noipv6 -forever -create -afteraccept '(matchbox-window-manager &) && firefox &'