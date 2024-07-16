FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt update && \
    apt install -y texlive-full lmodern libbz2-dev nano && \
    apt clean

RUN R -e "install.packages(c('kableExtra', 'mosaic', 'mosaicCore', 'MosaicData', 'openintro', 'palmerpenguins', 'cherryblossom', 'network', 'fivethirtyeight', 'Lock5Data', 'learnr', 'tutorial.helpers'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN R -e 'devtools::install_github("hadley/emo")'

USER $NB_USER

