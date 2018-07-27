FROM rocker/rstudio:devel

MAINTAINER Jinseob Kim "jinseob2kim@gmail.com"


RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libgit2-dev 
  
  
RUN R -e "install.packages(c('DT', 'data.table', 'ggplot2', 'devtools', 'epiDisplay', 'tableone', 'svglite', 'plotROC', 'pROC', 'labelled', 'geepack', 'lme4', 'PredictABEL', 'shinythemes', 'maxstat'), repos='https://cran.rstudio.com/')" 

## Private packages by Jinseob Kim
RUN R -e "devtools::install_github(c('jinseob2kim/jstable', 'jinseob2kim/jskm'))"


## default enable shiny-server
RUN export ADD=shiny && bash /etc/cont-init.d/add
