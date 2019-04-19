## Fallout-4-Prevent-Sleep
Prevents Windows from sleeping when Fallout 4 is running

I had an issue where if my computer slept when Fallout 4 was running, I was stuck on a black screen and couldn't Alt-Tab out or force quit and so was forced to hard reset.

I found the excellent little program [caffeine](https://www.zhornsoftware.co.uk/caffeine/) that will prevent sleep, but I didn't want to have to manually enable/disable it every time I opened the game, so I cobbled together a powershell script to do it for me.

Every 60 seconds, the script checks if a process named "Fallout4" is running, and if so it opens caffeine, waits for Fallout4 to close, then exits caffeine. I have also included instructions on how to setup a shortcut so that the script is run when Windows starts.

### Setup
1. Download caffeine.exe from the above link and place it in whatever directory you like 
2. Download Fallout4NoSleep.ps1 and place it in whatever directory you like
3. Open Fallout4NoSleep.ps1 in your favorite text editor (notepad works fine) and replace "ENTER_FILEPATH_HERE\caffeine.exe" with the path to the directory that holds caffeine. Be sure to leave the double quotes ("") in.
4. Open the windows startup folder (Press Win+R and enter "shell:startup")
5. Right click and select New -> Shortcut
6. In the "Type the location of this item:" box, enter the below text all on one line (swapping 'FILEPATH' for the actual path to Fallout4NoSleep.ps1):

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -Command "FILEPATH\Fallout4NoSleep.ps1"

7. Right-click your newly-created shortcut and in the "Start in:" field enter the path to the directory with Fallout4NoSleep.ps1

### Note
If you get an error saying that "execution of scripts is disabled on this system", open a command prompt as an administrator and enter "Set-ExecutionPolicy RemoteSigned" (Do so at your own risk, as [this SO user](https://stackoverflow.com/a/26955050) eloquently explains)
