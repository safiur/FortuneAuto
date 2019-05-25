Configuration DSCWave {
Archive DSCWave {
	DependsOn = '[Script]WebServerConfig';
	Ensure = 'Present';
	Path = "$env:windir\temp\DSC Resource Kit Wave 10 04012015.zip";
	Destination = "$env:ProgramFiles\WindowsPowerShell\Modules";
}

  Script DSCWave {
	GetScript = { @{ Result = (Test-Path -Path "$env:windir\temp\DSC Resource Kit Wave 10 04012015.zip"); } };
	SetScript = {
		$Uri = 'https://gallery.technet.microsoft.com/scriptcenter/DSC-Resource-Kit-All-c449312d/file/131371/4/DSC%20Resource%20Kit%20Wave%2010%2004012015.zip';
		$OutFile = "$env:windir\temp\DSC Resource Kit Wave 10 04012015.zip";
		Invoke-WebRequest -Uri $Uri -OutFile $OutFile;
		Unblock-File -Path $OutFile;
		};
	TestScript = { Test-Path -Path "$env:windir\temp\DSC Resource Kit Wave 10 04012015.zip"; } 
 }
}
. ./WebServerConfig.ps1
