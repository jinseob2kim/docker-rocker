FROM rocker/rstudio-stable:latest

MAINTAINER Jinseob Kim "jinseob2kim@gmail.com"


RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  locales \
  libxml2-dev \
  libcairo2-dev \
  libgit2-dev \
  tk-table

# Use UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8  
  
RUN R -e "install.packages(c('DT', 'data.table', 'ggplot2', 'devtools', 'epiDisplay', 'tableone', 'svglite', 'plotROC', 'pROC', 'labelled', 'geepack', 'lme4', 'PredictABEL', 'shinythemes', 'maxstat', 'manhattanly'), repos='https://cran.rstudio.com/')" 

## Private packages by Jinseob Kim
RUN R -e "devtools::install_github(c('jinseob2kim/jstable', 'jinseob2kim/jskm'))"

## default enable shiny-server
RUN export ADD=shiny && bash /etc/cont-init.d/add

## shiny-server.conf setting: ShinyApp & log directories
RUN sed -i 's/srv\/shiny-server/home\/rstudio\/ShinyApps/g' /etc/shiny-server/shiny-server.conf && \
    sed -i 's/var\/log\/shiny-server/home\/rstudio\/ShinyApps\/log/g' /etc/shiny-server/shiny-server.conf
    
## Download private ShinyApps
RUN git clone https://github.com/jinseob2kim/ShinyApps /home/rstudio/ShinyApps

## Permission
RUN groupadd shiny-apps && \
    usermod -aG shiny-apps rstudio && \
    usermod -aG shiny-apps shiny && \
    cd /home/rstudio/ShinyApps && \
    chown -R rstudio:shiny-apps . && \
    chmod g+w . && \
    chmod g+s .
    

