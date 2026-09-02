FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt update && \
    apt install -y texlive-full lmodern libbz2-dev nano && \
    apt clean

RUN mamba install -y --freeze-installed -c conda-forge \
    r-dt \
    r-fivethirtyeight \
    r-kableextra \
    r-ggally \
    r-leaflet \
    r-learnr \
    r-mosaic \
    r-mosaiccore \
    r-mosaicdata \
    r-network \
    r-palmerpenguins \
    r-skimr && mamba clean -afy 

RUN R -e 'pak::pkg_install("OpenIntroStat/cherryblossom")'
RUN R -e "install.packages(c('Lock5Data','openintro','tutorial.helpers'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"
RUN R -e 'pak::pkg_install("hadley/emo")'

USER $NB_USER



