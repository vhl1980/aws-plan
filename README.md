# aws-plan

## INSTALL PLAN TERRFORM

``` bash
sudo su - 
cd /usr/local/bin/
Get package https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip package
rm package

#Check install with another user
terraform -version
Terraform v0.12.24

```

## INIT AWS TERRAFORM

``` bash
# Create workspace terraform vpc
mkdir terraform/vpc

# CREATE FILE vars.tf
# VARS VPC
variable "AWS_REGION" {
    default = "eu-west-3"
}

# CREATE FILE provider.tf
provider "aws" {
    region = "${var.AWS_REGION}"
}

.
└── terraform
    └── vpc
        ├── provider.tf
        └── vars.tf

# init workspace
terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.54.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.54"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```
