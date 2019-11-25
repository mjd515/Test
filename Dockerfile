FROM x11docker/lxqt
RUN apt-get update -y
RUN apt-get install -y xpra
RUN apt-get install -y websockify
ENV --alsa
ENV --pulse-audio
RUN read Xenv < <(x11docker --xvfb x11docker/lxde pcmanfm)
RUN echo $Xenv && export $Xenv
# replace "start" with "start-desktop" to forward a desktop environment
RUN xpra start-desktop $DISPLAY --use-display \
     --html=on --bind-tcp=localhost:14501 \
     --start-via-proxy=no