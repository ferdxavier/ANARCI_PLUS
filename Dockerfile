FROM ubuntu

ARG PYTHON_VERSION=3.11.0
ARG VENV_VERSION=3.11

RUN mkdir -p /usr/spack
RUN mkdir -p /workdir/ANARCI
RUN chown 777 /usr/spack/

# Instala as ferramentas
RUN apt update \ 
    && apt install nano -y\ 
    && apt install gfortran -y \
    && apt install git -y \
    && apt install wget -y
    
# Instala o python
RUN apt install build-essential checkinstall -y \
    && apt install libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y \
    && cd opt \
    && wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tar.xz \
    && tar -xvf Python-$PYTHON_VERSION.tar.xz \
    && cd Python-$PYTHON_VERSION \
    && ./configure --enable-optimizations \
    && make altinstall \
    && cd /opt \
    && rm Python-$PYTHON_VERSION.tar.xz

# Cria a venv e instala as dependecias corretas
RUN python$VENV_VERSION -m venv /workdir/_venv

WORKDIR /workdir

COPY ./script_cont_create_venv.sh /workdir/
