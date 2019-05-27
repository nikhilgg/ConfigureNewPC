
Set-ExecutionPolicy Bypass -Scope Process -Force

if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    write-host -ForegroundColor Cyan "###Chocolatey is not installed. Attempting Install Now###"
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    
}
else{
    write-host -ForegroundColor Cyan "###Found Chocolatey installed already. Proceeding with the packages###"
}

$regex = "^([^#].*)"
Get-Content .\packages.txt | ForEach-Object {
if ($_ -match $regex){
    write-host -ForegroundColor Cyan "### Installing Package $_ ###"
    choco install $_ -y
}}

