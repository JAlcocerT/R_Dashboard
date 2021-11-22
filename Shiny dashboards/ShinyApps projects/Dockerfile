FROM rocker/tidyverse:latest
COPY . /PS_Dashboard
WORKDIR /PS_Dashboard
EXPOSE 5024
USER root
RUN install2.r --error \
	shiny \
	shinydashboard \
	lubridate
CMD ["Rscript","starter.R"]