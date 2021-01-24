# docker build . -t <MYIMAGE>
# docker run -it <MYIMAGE> bash
# Authors:
# Murat Keceli <keceli@gmail.com>

FROM continuumio/miniconda3
LABEL maintainer "Murat Keceli <keceli@gmail.com>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential \
                     gcc \
                     gfortran \
                     vim && \
    apt-get clean 

RUN mkdir -p  /container

RUN  cd /container && \
     git clone https://gitlab.com/ase/ase.git && \
     cd ase && \
     pip install -e .

RUN cd /container && \
	git clone https://github.com/atomistic-machine-learning/schnetpack.git && \
    cd schnetpack && \
	pip install -r requirements.txt && \
	pip install -e .

RUN cd /container && \
	git clone https://github.com/aiqm/torchani.git && \
	cd torchani && \
	pip install -e .

RUN cd /container && \
	git clone https://github.com/mir-group/flare && \
	cd flare && \
	pip install -e .

RUN cd /container && \
	mkdir -p data && \
	cd data 
