my_packages = c("plyr","shiny","shinythemes","leaflet","dplyr","markovifyR")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
  else {
    cat(paste("Skipping already installed package:", p, "\n"))
  }
}
invisible(sapply(my_packages, install_if_missing))

RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('jsonlite')"
RUN R -e "install.packages('devtools')"
RUN R -e "devtools::install_github('abresler/markovifyR')"
RUN R -e "markovifyR::install_markovify()"