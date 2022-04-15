## Work with systemctl System State Commands
* Review the section for halt.target: /halt.target
* * Search for the word "shutdown" and review the related entries: /shutdown
* * Search for "message=" and review the related entries: /message=
* * Search for "dry-run" and review the related entries: /dry-run
* Show the systemctl options that start with "re": systemctl re
* Do a dry-run system shutdown and include a warning message: sudo systemctl --dry-run reboot --message="System going down now, please save your work"


## Query and Set the Default Target of a System

* Check the current default target: sudo systemctl get-default
* View additional details for the default target: ls -l /etc/systemd/system/default.target
* Change the default target to graphical.target: sudo systemctl set-default graphical.target
* Reboot the system: sudo systemctl reboot

## Work with the Traditional System State Commands
* Find the path for shutdown: which shutdown
* Find the paths for shutdown, poweroff, reboot, halt: which {shutdown,poweroff,reboot,halt}
* List additional details regarding the 4 files: which {shutdown,poweroff,reboot,halt} | xargs ls -l, which {shutdown,poweroff,reboot,halt} | xargs file
* Using xargs, show the man pages for the 4 files: echo {shutdown,poweroff,reboot,halt} | xargs man
* Set the system to shutdown 15 minutes in the future with a warning message: sudo shutdown -r +15 "Please save all work and sign off, the server is rebooting in 15 minutes"
* Cancel the scheduled shutdown: sudo shutdown -c 
* Shutdown the lab server: sudo shutdown -h now


# Identify CPU/Memory Intensive Processes and Kill Processes Query the System to View an Overview of the System's State
* Run the top command: top
* * Toggle through the four positions when you press t and notice how the third line changes to two types of graphs: off and the default. Do the same with the m key for the memory information. Press q to quit.
* Install the iotop command with root permissions: sudo dnf install 
* sudo iotop: Use the left and right keys to move the sort column.
* * Press r to affect the least/most values.
* * Press p to toggle task/PID.
* * Press o to toggle only active processes.
* * Press q to quit.
* Use the screen command to set up a monitoring display: screen -S Sys-Monitor -t cmdline
* * Press Ctrl+a | to split the screen into two regions.
* * Press Ctrl+a Tab to switch to the right side of the screen, and press Ctrl+a c to open a bash shell.

Run the top command on the right side to view the processes running and information about them.

Press Ctrl+a Tab to move back to the left side of the screen.

Run the stress process:

stress -c 1
Take note of the process ID (PID) that is displayed on the left, and note that the process ID (PID) displayed on the right will always be one more.

Press Ctrl+z and enter bg to run the stress process in the background.

On the right screen, note that the number displayed in the NI column for the current process ID is 0 (zero).

Modify the Priority of a Running Process
Use the renice command with root permissions to change the priority, using the PID from the right side of the screen:

sudo renice -n 10 <PID>
On the right screen, the number displayed in the NI column for the current process ID in the table should change to 10, denoting that the priority has been lowered by an increment of 10.

Run the jobs command to determine which process is running.

Then, use the kill command to terminate the process:

kill %1
On the right side of the screen, the process ID the was just running should disappear.

Modify the Priority of a Process When It Starts
Use the nice command to run a command with an automatically lowered priority when it starts:

nice stress -c 1
Take note of the process ID that is displayed on the right side of the screen for this process.

Press Ctrl+a Tab to move back to the right region of the screen.

Press r to renice the process.

Press Enter to accept the current PID as the selected process, and enter 19 for the priority level.

Press Enter. The number displayed in the NI column for the current process ID in the table should change to 19.

Press k to kill the process.

Press Enter to accept the current PID as the selected process, and enter 9 to kill it.

Note that you can see messages about the termination and that the process has been killed on the left side of the screen.

Kill Running Processes and Exit Screen Monitoring
Press Ctrl+a Tab to move back to the left region of the screen.

Run the stress process in the background:

stress -c 1 &
Note: You may need to press Enter to bring the command line up again after this process has started running.

Use the pgrep command to determine which process IDs are currently running the stress process:

pgrep stress
This should return the process IDs from both sides of the screen — take note of both PIDs.

Use the pkill command to kill the stress process:

pkill -9 stress
Note that you can see that the process has been killed on the left side of the screen, and that the process ID that had been running the stress process has disappeared on the right.

Use pkill to exit screen monitoring:

pkill screen
The screen should return to a single bash shell command view. If it does not, you can use screen -ls to see if screen is still running or screen -wipe to clear the dead screen session.

Adjust Process Scheduling
Kick Off a Process and View Its Settings
Run the stress process in the background:

stress -c 1 &
Note: You may need to press Enter to bring the command line up again after this process has started running.

Use the pgrep command to determine which process ID are currently running the stress process:

pgrep stress
This should return the process IDs that are currently running the process. Take note of the first PID.

Use the chrt command to view the scheduling settings for the process:

chrt -p <PID>
The current scheduling policy for this process ID should be SCHED_OTHER and the priority should be 0 (zero).

Modify the Settings on the Running Process
Change the settings so it has a modified scheduling policy and a priority level of 33:

sudo chrt -r -p 33 <PID>
View the settings for the PID again to make sure they have changed:

chrt -p <PID>
The scheduling policy for this process should now be SCHED_RR and the priority should be 33.

Kill the process:

kill -9 <PID>
Create a Process with Non-Default Settings
Run a stress process with a modified scheduling policy and priority level of 44:

sudo chrt -f 44 stress -c 1 &
Take note of the PID for the running process in the message returned.

View the settings for the PID to make sure they have been set as configured:

chrt -p <PID>
The scheduling policy for this process should be SCHED_FIFO and the priority should be 44.

Manage Tuning Profiles
View and Modify the Active Tuned Profile
View the tuning profiles that are included in Tuned:

ls -l /usr/lib/tuned
View the custom profiles that are included in Tuned:

ls -l /etc/tuned
Determine which of the Tuned profiles is currently active on the system:

tuned-adm active
The active profile should be virtual-guest.

Change the active profile to be the powersave profile:

sudo tuned-adm profile powersave
Verify that the profile was changed:

tuned-adm active
The active profile should now be powersave.

Set the active profile to be both virtual-guest and powersave concurrently:

sudo tuned-adm profile virtual-guest powersave
Verify that the active profiles have changed:

tuned-adm active
The active profiles should now be virtual-guest and powersave.

View the Differences Between Tuned Profiles
View the differences between the virtual-guest and virtual-host profiles:

vimdiff /usr/lib/tuned/virtual-guest/tuned.conf /usr/lib/tuned/virtual-host/tuned.conf
This will show the two profiles side-by-side in a split-screen mode, virtual-guest on the left and virtual-host on the right. You can view the differences between the two profiles.

Exit without saving by pressing Escape followed by :qa!.

Modify the Dynamic Tuning Setting in the Main Tuned Configuration File
Use grep to determine the line number in the main Tuned configuration file where dynamic tuning is set:

grep -n dynamic_tuning /etc/tuned/tuned-main.conf
The output returned is 10:dynamic_tuning = #, which tells you that dynamic_tuning is configured on line 10 and whether it is currently turned on (1) or turned off (0).

Change the dynamic tuning setting in the main configuration file:

sudo vim +10 /etc/tuned/tuned-main.conf
Verify that the file opens to line 10, then navigate to the end of the line and change the current setting (either from 0 to 1 or from 1 to 0, depending on what was set prior.)

Note: Don't forget to press the i key to input changes.

Save and exit the file by pressing Escape followed by Shift+ZZ.

Restart the Tuned service to enact the changes:

sudo systemctl restart tuned