# Retrieve the default VPC ID
vpc_id=$(aws ec2 describe-vpcs --filters "Name=isDefault,Values=true" --query "Vpcs[0].VpcId" --output text)
echo "Default VPC ID: $vpc_id"

# Variables
security_group_name="group_name"
description="group_name access"

# Create the security group
security_group_id=$(aws ec2 create-security-group --group-name $security_group_name --description "$description" --vpc-id $vpc_id --query 'GroupId' --output text)
echo "Security group created with ID: $security_group_id"

# Add an inbound rule for HTTP (port 80)
aws ec2 authorize-security-group-ingress --group-id $security_group_id --protocol tcp --port 80 --cidr 0.0.0.0/0
echo "Inbound rule for HTTP added to security group $security_group_id"

# Verify the security group rules
aws ec2 describe-security-groups --group-ids $security_group_id --query 'SecurityGroups[*].IpPermissions'
