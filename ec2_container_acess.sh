role_name=role_name

# AmazonEC2ContainerRegistryFullAccess
aws iam attach-role-policy --role-name role-acesso-ssm --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess

# AmazonECS_FullAccess
aws iam attach-role-policy --role-name role-acesso-ssm --policy-arn arn:aws:iam::aws:policy/AmazonECS_FullAccess