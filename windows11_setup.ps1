# Run this in Windows Powershell - as Administrator

Write-Host "Checking if Chocolatey is installed..." -ForegroundColor Cyan

if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Installing Chocolatey..." -ForegroundColor Yellow

    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

    Write-Host "Chocolatey installation completed." -ForegroundColor Green
} else {
    Write-Host "Chocolatey is already installed." -ForegroundColor Green
}

# Refresh environment
refreshenv

# List of packages
$packages = @(
  "vscode",
  "intellijidea-toolbox",
  "git",
  "openjdk21",
  "maven",
  "gradle",
  "python",
	"nodejs",
	"golang",
	"chromedriver",
	"yarn",
	"docker-desktop",
	"gh",
	"minikube",
	"awscli",
	"azure-cli",
	"openssl",
	"terraform",
	"postman",
	"notepadplusplus",
	"7zip",
	"virtualbox",
	"vlc",
	"irfanview",
	"rufus",
	"foxitreader",
	"windirstat"
	
)

Write-Host "Installing packages: $($packages -join ', ')" -ForegroundColor Cyan

foreach ($pkg in $packages) {
    Write-Host "Installing $pkg ..." -ForegroundColor Yellow
    choco install $pkg -y --ignore-checksums
}

Write-Host "All installations complete!" -ForegroundColor Green

# Show versions
Write-Host "InInstalled versions:" -ForegroundColor Cyan
git --version
java --version
mvn -version
gradle -version
python --version
