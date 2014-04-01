# Version attributes

default["fossology"]["version"] = "2.4.0"

# Define attributes for the server node

default["fossology"]["server"] = {
  "name" => "localhost", 
  "max_jobs" => 10
}

# SSH attributes

default["fossology"]["ssh_public_key"] = nil
default["fossology"]["ssh_private_key"] = nil

default["openssh"]["client"] = {
  "*" => {
    "strict_host_key_checking" => "no"
  }
}

# PostgreSQL tuning

default["postgresql"]["config"]["listen_addresses"] = "*"
