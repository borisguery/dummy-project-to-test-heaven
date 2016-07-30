set :stage, :staging
set :symfony_env,  "dev"
set :file_permissions_paths, ["var"]
set :permission_method, :acl

server 'ec2-52-64-41-154.ap-southeast-2.compute.amazonaws.com', user: 'ubuntu', roles: %w{app db web}
