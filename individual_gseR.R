library(googleComputeEngineR)
project = "scmerge"
zone = "australia-southeast1-a"
# zone = "asia-east2-a" ## Hong Kong server
gce_global_project(project)
gce_global_zone(zone)

users = readr::read_csv("names.csv")
set.seed(1234)
library(dplyr)
users$Password = replicate(n = nrow(users), expr = {sample(0:9, 4, replace = TRUE) %>% paste(collapse = "")}, simplify = FALSE) %>% as.character()


(tag = gce_tag_container("scp_docker:9c35fce"))

for(i in seq_len(nrow(users))){
  assign(users$Username[i],
         gce_vm(template = "rstudio",
                name = users$Username[i],
                disk_size_gb = 15,
                predefined_type = "n1-standard-2",
                dynamic_image = tag,
                user = users$Username[i],
                password = users$Password[i]))
}



# purrr::map2(.x = users$Username, 
#             .y = users$Password, 
#             .f = ~ setup_single(name = .x, password = .y))
