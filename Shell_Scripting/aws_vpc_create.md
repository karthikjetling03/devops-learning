# AWS VPC Management Script

This Bash script allows you to create and delete an AWS VPC and its associated subnet. It checks if the AWS CLI is installed and provides options to either create or teardown the resources. It has been completed created using the Github Copilot - AI Pair Programmer. 

## Description

- Creates a VPC in AWS
- Creates a public subnet within the VPC
- Checks if the AWS CLI is installed
- Accepts two arguments:
  - `create` - Creates the VPC and subnet
  - `teardown` - Deletes the VPC and subnet
- If no argument is provided, the script prompts the user to choose an option

## Prerequisites

- AWS CLI must be installed and configured with appropriate permissions

## Usage

1. Clone the repository or download the script.
2. Make the script executable:
    ```bash
    chmod +x aws_vpc_create.sh
    ```
3. Run the script with the desired option:
    ```bash
    ./aws_vpc_create.sh create
    ```
    or
    ```bash
    ./aws_vpc_create.sh teardown
    ```
4. If no argument is provided, the script will prompt you to enter `create` or `teardown`:
    ```bash
    ./aws_vpc_create.sh
    ```

## Variables

The script uses the following variables which can be modified as needed:

- `vpc_cidr_block="10.0.0.0/16"`
- `subnet_cidr_block="10.0.4.0/24"`
- `subnet_availability_zone="ap-south-1a"`
- `vpc_name="my-vpc"`
- `subnet_name="my-subnet"`
- `aws_region="ap-south-1"`

## Functions

- `create_vpc`: Creates a VPC and tags it with the specified name.
- `create_subnet`: Creates a subnet within the VPC and tags it with the specified name.
- `delete_vpc`: Deletes the VPC based on the specified name tag.
- `delete_subnet`: Deletes the subnet based on the specified name tag.

## License

This project is licensed under the MIT License.