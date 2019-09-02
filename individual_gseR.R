library(googleComputeEngineR)
library(dplyr)

project = "scmerge"
gce_global_project(project)
# View(gce_list_machinetype()$items)

users = readr::read_csv("names.csv") %>% 
  dplyr::mutate_all(as.character)
table(users$Group, users$Zone)

(tag = gce_tag_container("scp_docker:9c35fce"))

for(machine_name in unique(users$Group)){
  this_machine_users = users %>% 
    dplyr::filter(Group == machine_name)
  
  zone = unique(this_machine_users$Zone)
  stopifnot(length(zone) == 1L)
  gce_global_zone(zone)
  
  assign(machine_name,
         gce_vm(template = "rstudio",
                name = machine_name,
                disk_size_gb = 50,
                predefined_type = "n1-standard-16",
                dynamic_image = tag,
                user = "rstudio",
                password = "pushu"))
  
  assign(machine_name,
         gce_ssh_setup(eval(parse(text = machine_name)),
                       username = "rstudio",
                       key.pub = "~/.ssh/id_rsa.pub",
                       key.private = "~/.ssh/id_rsa"))
  
  Sys.sleep(30)
  
  for (j in 1:nrow(this_machine_users)){
    print(this_machine_users[j,])
    gce_rstudio_adduser(instance = eval(parse(text = machine_name)),
                        username = this_machine_users$Username[j],
                        password = this_machine_users$Password[j],
                        admin = FALSE, container = "rstudio")
  Sys.sleep(10)
  } ## End j
} ## End i