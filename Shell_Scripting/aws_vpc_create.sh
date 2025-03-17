#!/bin/bash

#############################
####  Description ###########
# - create a vpc in aws
# - create a public subnet
# - check if aws cli is installed or not
# - this shell script will accept two arguments. 
#     - create - which will create the resources in the aws
#     - teardown - which will delete the resources in the aws
#     - if no argument is provide, it should ask to choose the option as either of the above
#############################

# Variables
vpc_cidr_block="10.0.0.0/16"
subnet_cidr_block="10.0.4.0/24"
subnet_availability_zone="ap-south-1a"
vpc_name="my-vpc"
subnet_name="my-subnet"
aws_region="ap-south-1"

# Check if aws cli is installed or not
if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install it first."
    exit
fi

# Function to create vpc
create_vpc() {
    echo "Creating VPC..."
    vpc_id=$(aws ec2 create-vpc --cidr-block $vpc_cidr_block --query 'Vpc.VpcId' --output text)
    aws ec2 create-tags --resources $vpc_id --tags Key=Name,Value=$vpc_name
    echo "VPC created with id: $vpc_id"
}

# Function to create subnet
create_subnet() {
    echo "Creating Subnet..."
    subnet_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block $subnet_cidr_block --availability-zone $subnet_availability_zone --query 'Subnet.SubnetId' --output text)
    aws ec2 create-tags --resources $subnet_id --tags Key=Name,Value=$subnet_name
    echo "Subnet created with id: $subnet_id"
}

# Function to delete vpc
delete_vpc() {
    echo "Fetching VPC ID..."
    vpc_id=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=$vpc_name" --query 'Vpcs[0].VpcId' --output text)
    if [ "$vpc_id" == "None" ]; then
        echo "VPC not found!"
        exit 1
    fi
    echo "Deleting VPC with ID: $vpc_id..."
    aws ec2 delete-vpc --vpc-id $vpc_id
    echo "VPC deleted successfully"
}

# Function to delete subnet
delete_subnet() {
    echo "Fetching Subnet ID..."
    subnet_id=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=$subnet_name" --query 'Subnets[0].SubnetId' --output text)
    if [ "$subnet_id" == "None" ]; then
        echo "Subnet not found!"
        exit 1
    fi
    echo "Deleting Subnet with ID: $subnet_id..."
    aws ec2 delete-subnet --subnet-id $subnet_id
    echo "Subnet deleted successfully"
}

# Main function
main() {
    if [ -z "$1" ]; then
        echo "Please choose the option to create or teardown the resources"
        read -p "Enter 'create' to create resources or 'teardown' to delete resources: " user_input
    else
        user_input=$1
    fi

    if [ "$user_input" == "create" ]; then
        create_vpc
        create_subnet
    elif [ "$user_input" == "teardown" ]; then
        delete_subnet
        delete_vpc
    else
        echo "Invalid option. Please choose 'create' or 'teardown'."
    fi
}

main $1