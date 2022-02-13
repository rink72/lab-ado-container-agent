# General configuration
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
alias aptget='apt-get -y -qq -o Dpkg::Use-Pty=0'
export DEBIAN_FRONTEND=noninteractive
LOCAL_USER=labuser

# Versions
GOOGLE_CLOUD_SDK_VERSION=372.0.0-0
PWSH_VERSION=7.2.1-1.deb
TERRAFORM_VERSION=1.1.5
TERRAGRUNT_VERSION=v0.36.1

# Update apt
aptget update

# Install base requirements
aptget install curl apt-transport-https ca-certificates gnupg wget software-properties-common apt-utils

# Install gcloud sdk
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
aptget update
aptget install google-cloud-sdk=$GOOGLE_CLOUD_SDK_VERSION

# Install pwsh
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
aptget update
aptget install powershell=$PWSH_VERSION

# Install Powershell required modules
pwsh -C "Install-Module GoogleCloud -Force"

# Install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
aptget update
aptget install terraform=$TERRAFORM_VERSION

# Install terragrunt
wget -q https://github.com/gruntwork-io/terragrunt/releases/download/$TERRAGRUNT_VERSION/terragrunt_linux_amd64 -O /usr/local/bin/terragrunt
chmod 0755 /usr/local/bin/terragrunt