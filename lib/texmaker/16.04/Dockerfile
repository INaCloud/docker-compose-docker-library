FROM texlive:16.04

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

RUN apt-get update && apt-get install --yes --no-install-recommends \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	texmaker \
	&& apt-get autoclean -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* 

RUN useradd texmaker \
	&& mkdir /home/texmaker \
	&& chown texmaker:texmaker /home/texmaker

USER texmaker
WORKDIR /home/texmaker

ENTRYPOINT [ "texmaker" ]

# 
# docker run -it --rm=true \
# 		-e USER=$USER -e USERID=$UID \		# bind user for file permissions
#		-v /tmp/.X11-unix:/tmp/.X11-unix \ 	# mount the X11 socket
#		-e DISPLAY=unix$DISPLAY \ 			# pass the display
#		--device /dev/dri \
#		-v $HOME:/home/texmaker \			# mount $HOME
#		--name texmaker benizar/texmaker
#
#docker run -it --rm=true -e USER=$USER -e USERID=$UID -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/dri -v $HOME:/home/texmaker --name texmaker benizar/texmaker


