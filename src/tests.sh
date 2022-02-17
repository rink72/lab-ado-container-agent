terraform -version || exit 1
terragrunt -version || exit 1
gcloud --version || exit 1
pwsh -v || exit 1
pwsh -C "Import-Module GoogleCloud -ErrorAction Stop" || exit 1
ansible --version || exit 1
