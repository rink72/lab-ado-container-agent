# Environment vars
APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=true

# Versions
GOOGLE_CLOUD_SDK_VERSION=371.0.0-0
PWSH_VERSION=7.2.1-1.deb
TERRAFORM_VERSION=1.1.5

# Update apt
apt-get update

# Install base requirements
apt-get install -y curl apt-transport-https ca-certificates gnupg wget software-properties-common

# Install gcloud sdk
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update
apt-get install -y google-cloud-sdk=$GOOGLE_CLOUD_SDK_VERSION

# Install pwsh
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install -y powershell=$PWSH_VERSION

# Install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update
apt-get install -y terraform=$TERRAFORM_VERSION

# Install terragrunt
wget -q https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.1/terragrunt_darwin_amd64