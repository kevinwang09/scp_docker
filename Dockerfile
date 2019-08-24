# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

# The suggested name for this image is: bioconductor/release_base.

FROM bioconductor/release_core2

MAINTAINER kevin.wang@sydney.edu.au

ADD install.R /home/
ADD setup.R /home/
ADD user_test.R /home/

# Make a tmp folder and copy all files into /home/rstudio/ which is shared by everyone.
RUN mkdir /home/tmp/
RUN git clone https://github.com/SydneyBioX/SingleCellPlus /home/tmp/
RUN mkdir /home/SingleCellPlus/
RUN cp -r /home/tmp/ /home/SingleCellPlus/
# We will remove these data since we will have another copy from Google Cloud Storage
RUN ls /home/
RUN ls /home/tmp/
RUN ls /home/SingleCellPlus/
RUN ls /home/rstudio/



# wget large data files from Google Cloud Storage
RUN wget https://storage.googleapis.com/scp_data/data.zip -P /home/SingleCellPlus/
RUN unzip /home/SingleCellPlus/data.zip
RUN rm -rf /home/SingleCellPlus/data.zip
RUN ls /home/
RUN ls /home/tmp/
RUN ls /home/SingleCellPlus/
RUN ls /home/rstudio/


# RUN R -f /home/install.R
# RUN ls /home/rstudio/
# RUN touch /home/omg.R