## If things goes wrong, 
## the admin of the workshop will 
#
# sudo rm -rf /home/tmp/*
# cd /home/tmp/
# sudo git clone https://github.com/SydneyBioX/SingleCellPlus 
# sudo cp -r /home/tmp/SingleCellPlus/* ./
# sudo rm -rf SingleCellPlus
## and ask all users to run this script
system(paste0("cp -r /home/tmp/* ", getwd()))

devtools::install_github("IndrajeetPatil/kittyR")
set.seed(100)
kittyR::kittyR(meow = FALSE)