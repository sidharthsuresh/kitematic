get-process VBox* | stop-process

$paths = '~/Tripod/', '~/.docker', '~/.VirtualBox/', '~/Tripod-bins/', '~/Library/Application Support/Tripod'

Foreach($path in $paths) {
    if(test-path $path) {
        Remove-Item $path -Force -Recurse
    }
}

$virtualBoxApp = Get-WmiObject -Class Win32_Product | Where {$_.Name -Match 'VirtualBox'}

if($virtualBoxApp -ne $null) {
    $virtualBoxApp.Uninstall()
}
