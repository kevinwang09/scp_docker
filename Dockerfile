# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

# The suggested name for this image is: bioconductor/release_base.

FROM bioconductor/release_core2

MAINTAINER kevin.wang@sydney.edu.au

ADD install.R /home/
ADD setup.R /home/
ADD internal_test.R /home/
ADD user_test.R /home/

RUN cd /home/
RUN git clone https://github.com/SydneyBioX/SingleCellPlus
RUN cp -r /home/SingleCellPlus /home/rstudio/
RUN rm -rf /home/rstudio/data/
RUN rm -rf /home/SingleCellPlus/

RUN wget https://storage.googleapis.com/scp_data/data.zip -P /home/rstudio/
RUN cd /home/rstudio/ && unzip data.zip
RUN rm -rf /home/rstudio/data.zip

#RUN cp ./SingleCellPlus/qc.Rmd /home/rstudio/
#RUN cp ./SingleCellPlus/scMerge.Rmd /home/rstudio/
#RUN cp ./SingleCellPlus/downstream.Rmd /home/rstudio/
#RUN rm -rf /home/rstudio/SingleCellPlus
RUN ls /home/
RUN ls /home/rstudio/

#RUN R -f /home/install.R
#RUN ls /home/rstudio/
#RUN R -f /home/internal_test.R