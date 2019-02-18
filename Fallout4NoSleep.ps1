#this prevents the powershell window from sticking around
Add-Type -Name win -MemberDefinition '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);' -Namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle,0)

#this is the name of the process to monitor
$target = "Fallout4"

#this script will check every 60 seconds if the abovenamed process is running
#if it is, it will launch caffeine, wait for the process to end, then quit caffeine
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
while ($true)
{
    while (!($process))
    {
        $process = Get-Process | Where-Object {$_.ProcessName -eq $target}
        start-sleep -s 60
    }
    if ($process)
    {
        Start-Process -FilePath "ENTER_FILEPATH_HERE\caffeine.exe"
        $process.WaitForExit()
        start-sleep -s 5
        $process = Get-Process | Where-Object {$_.ProcessName -eq $target}
        Stop-Process -processname "caffeine"
    }
}
