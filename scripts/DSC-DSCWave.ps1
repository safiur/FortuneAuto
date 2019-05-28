$path = "C:\Program Files\WindowsPowerShell\Modules"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
$clnt = new-object System.Net.WebClient
$url = @('https://github.com/safiur/FortuneAuto/raw/master/scripts/fortuneweb.zip',
        'https://gallery.technet.microsoft.com/scriptcenter/DSC-Resource-Kit-All-c449312d/file/131371/4/DSC%20Resource%20Kit%20Wave%2010%2004012015.zip'
        )
$file1 = "C:\Windows\Temp\fortuneweb.zip"
$file2 = "C:\Windows\Temp\DSC Resource Kit Wave 10 04012015.zip"
[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
$clnt.DownloadFile($url[0],$file1)
$clnt.DownloadFile($url[1],$file2)

$shell_app=new-object -com shell.application 
$zip_file = $shell_app.namespace($file2) 
$destination = $shell_app.namespace("$path") 
Remove-Item "$path*.*"  -recurse -force -ea silentlycontinue
$destination.Copyhere($zip_file.items())

