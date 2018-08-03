# docker-rocker

[![GitHub issues](https://img.shields.io/github/issues/jinseob2kim/docker-shinyserver.svg)](https://github.com/jinseob2kim/docker-rocker/issues)
[![GitHub forks](https://img.shields.io/github/forks/jinseob2kim/docker-shinyserver.svg)](https://github.com/jinseob2kim/docker-rocker/network)
[![GitHub stars](https://img.shields.io/github/stars/jinseob2kim/docker-shinyserver.svg)](https://github.com/jinseob2kim/docker-rocker/stargazers)
[![GitHub license](https://img.shields.io/github/license/jinseob2kim/docker-shinyserver.svg)](https://github.com/jinseob2kim/docker-rocker/blob/master/LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/google/skia.svg)](https://github.com/jinseob2kim/docker-rocker)

Docker images for rstudio and shiny-server: Add some packages to rocker & shiny-server default on


## Introduce

Original docker image: https://hub.docker.com/r/rocker/rstudio/


I add some useful packaes for shiny: **DT, data.table, ggplot2, devtools, epiDisplay, tableone, svglite, plotROC, pROC, labelled, geepack, lme4, PredictABEL, shinythemes, maxstat, plotly, manhattanly**


## Image download & run
Assume local user: username **rstudio**, password **rstudio**


```shell
docker run --rm -d -p 3838:3838 -p 8787:8787 \
    -e USER=rstudio -e PASSWORD=rstudio -e ROOT=TRUE  \
    -v $(pwd):/home/rstudio \ 
    jinseob2kim/docker-rocker

```

Default shinyapps directory is `/home/rstudio/ShinyApps`



## Run (8787- rstudio server, 3838- shiny server)

1. Local cumputer : http://localhost:8787, http://localhost:3838,


2. Server : **Your IP**:8787, **Your IP**:3838
