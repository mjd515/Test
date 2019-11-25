FROM x11docker/xfce-wine-playonlinux
RUN read Xenv < <(x11docker --xvfb x11docker/lxde pcmanfm)
	echo $Xenv && export $Xenv
	# replace "start" with "start-desktop" to forward a desktop environment
	xpra start $DISPLAY --use-display \
     --html=on --bind-tcp=localhost:14501 \
     --start-via-proxy=no