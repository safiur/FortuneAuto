$clnt = new-object System.Net.WebClient
$url = "https://gallery.technet.microsoft.com/scriptcenter/DSC-Resource-Kit-All-c449312d/file/131371/4/DSC%20Resource%20Kit%20Wave%2010%2004012015.zip"
$file = "C:\Windows\Temp\DSC Resource Kit Wave 10 04012015.zip"
$clnt.DownloadFile($url,$file)

$shell_app=new-object -com shell.application 
$zip_file = $shell_app.namespace($file) 
$destination = $shell_app.namespace("C:\Program Files\WindowsPowerShell\Modules") 
Remove-Item "C:\Program Files\WindowsPowerShell\Modules*.*"  -recurse -force -ea silentlycontinue
$destination.Copyhere($zip_file.items())

