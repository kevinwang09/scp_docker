library(googleComputeEngineR)
project = "scmerge"
zone = "australia-southeast1-a"
# zone = "asia-east2-a" ## Hong Kong server

gce_global_project(project)
gce_global_zone(zone)
# gce_get_project()
# gce_list_zones(project)
# View(gce_list_machinetype()$items)

(tag = gce_tag_container("scp_docker:9c35fce"))

vm <- gce_vm(template = "rstudio", 
             name = "singlecellplus1",
             disk_size_gb = 100,
             predefined_type = "n1-standard-16",
             dynamic_image = tag,
             user = "rstudio", 
             password = "pushu")

# bash: gcloud compute ssh singlecellplus1
vm <- gce_ssh_setup(vm,
                    username = "rstudio",
                    key.pub = "~/.ssh/id_rsa.pub",
                    key.private = "~/.ssh/id_rsa")
# gce_ssh(vm, "echo foo", username = "rstudio")

##################################################

names = readr::read_csv("names.csv")
purrr::map2(.x = names$Username,
           .y = names$Password,
           .f = ~ gce_rstudio_adduser(instance = vm2, username = .x, password = .y))

################################################################################################
# zone = "asia-northeast1-a" ## Tokyo server
# gce_global_project(project)
# gce_global_zone(zone)
# vm2 <- gce_vm(template = "rstudio", 
#              name = "singlecellplus2", 
#              predefined_type = "n1-highmem-16",
#              dynamic_image = tag,
#              user = "rstudio", 
#              password = "pushu")
# vm2 <- gce_ssh_setup(vm2,
#                     username = "rstudio",
#                     key.pub = "~/.ssh/id_rsa.pub",
#                     key.private = "~/.ssh/id_rsa")

# purrr::map(.x = userGroups$`2`, 
#            .f = ~ gce_rstudio_adduser(instance = vm2, username = .x, password = .x))