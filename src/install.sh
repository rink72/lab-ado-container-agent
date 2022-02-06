# Update apt
apt update

# Install base requirements
apt install -y curl apt-transport-https ca-certificates gnupg wget software-properties-common

# Install gcloud sdk
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt update
apt install -y google-cloud-sdk

# Install pwsh
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt update
apt install -y powershell

# Install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update
aptinstall -y terraform

# Install terragrunt