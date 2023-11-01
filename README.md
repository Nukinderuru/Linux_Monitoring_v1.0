# Linux Monitoring v1.0

Linux basic bash scripting and system research.\
This file contains the descriptions of the bash scripts located in the folders 01-05.

![LinuxMonitoring](/images/LinuxMonitoring.jpg)

## Contents

1. [First effort](#part-1-first-effort)  
2. [System research](#part-2-system-research)  
3. [Visual output design for the system research script](#part-3-visual-output-design-for-the-system-research-script)   
4. [Configuring visual output design for the system research script.](#part-4-configuring-visual-output-design-for-the-system-research-script)  
5. [File system research](#part-5-file-system-research)

## Part 1. First effort

This is a bash script which is run with one text parameter.
It outputs the value of the parameter.  
If the parameter is a number, the script outputs an invalid input message.

## Part 2. System research

This is a bash script which outputs the following information:

**HOSTNAME** = _network name_  
**TIMEZONE** = _time zone as: **America/New_York UTC -5** (time zone must be taken from the system and be correct for the current location)_  
**USER** = _current user who ran the script_  
**OS** = _type and version of operating system_  
**DATE** = _current time as: **12 May 2020 12:24:36**_  
**UPTIME** = _system uptime_  
**UPTIME_SEC** = _system uptime in seconds_  
**IP** = _ip address of the machine on any of the network interfaces  
**MASK** = _network mask of any of the network interfaces as: **xxx.xxx.xxx.xxx**_.  
**GATEWAY** = _default gateway ip_  
**RAM_TOTAL** = _main memory size in GB with an accuracy of three decimal places as: **3.125 GB**_  
**RAM_USED** = _used memory size in GB with an accuracy of three decimal places_  
**RAM_FREE** = _free memory size in GB, with an accuracy of three decimal places_  
**SPACE_ROOT** = _root partition size in MB, with an accuracy of two decimal places, as **254.25 MB**_  
**SPACE_ROOT_USED** = _size of used space of the root partition in MB, with an accuracy of two decimal places_  
**SPACE_ROOT_FREE** = _size of free space of the root partition in MB, with an accuracy of two decimal places_

After outputting the values, the script suggests writing the data to a file.

If the user agrees, a file is created in the current directory containing the information that had been outputted.
The file name looks like: **DD_MM_YY_HH_MM_SS.status** and indicates when the data was saved.

## Part 3. Visual output design for the system research script

This bash script outputs the same information as the previous one from [**Part 2**](#part-2-system-research), but does not suggest saving the data.  Instead, the text and the background colour of the output can be coloured, using the numbers put as the parameters. The parameters must be numbers from 1 to 6, for example:  
`script03.sh 1 3 4 5`

Colour designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)

**Parameter 1** is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 2** is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 3** is the background of the values (after the '=' sign)  
**Parameter 4** is the font colour of the values (after the '=' sign)

The font and background colours of one column must not match.  
If matching values are entered, there appears a message describing the problem and offering to call the script again.

## Part 4. Configuring visual output design for the system research script

This is a bash script similar to the script from [**Part 3**](#part-3-visual-output-design-for-the-system-research-script). The colour designations are similar. The script runs without parameters. The parameters are set in the configuration file before the script is running.

This is what the configuration file should look like:
```
column1_background=2
column1_font_color=4
column2_background=5
column2_font_color=1
```

If one or more parameters are not set in the configuration file, the colour is substituted from the default colour scheme (colours_default.sh).


After the system information output from [**Part 3**](#part-3-visual-output-design-for-the-system-research-script), the colour scheme is also output as follows:
```
Column 1 background = 2 (red)
Column 1 font color = 4 (blue)
Column 2 background = 5 (purple)
Column 2 font color = 1 (white)
```

## Part 5. File system research

This bash script is run with a single parameter.  
The parameter is an absolute or relative path to a directory. The parameter must end with '/', for example:  
`script05.sh /var/log/`

The script outputs the following information about the directory specified in the parameter:
- Total number of folders, including subfolders
- Top 5 folders with largest size in descending order (path and size)
- Total number of files
- Number of configuration files (with .conf extension), text files, executable files, log files (files with .log extension), archives, symbolic links
- Top 10 files with largest size in descending order (path, size and type)
- Top 10 executable files with largest size in descending order (path, size and hash)
- Execution time of the script

The script output looks like this:

```
Total number of folders (including all nested ones) = 6  
TOP 5 folders of maximum size arranged in descending order (path and size):  
1 - /var/log/one/, 100 GB  
2 - /var/log/two/, 100 MB  
etc up to 5
Total number of files = 30
Number of:  
Configuration files (with the .conf extension) = 1 
Text files = 10  
Executable files = 5
Log files (with the extension .log) = 2  
Archive files = 3  
Symbolic links = 4  
TOP 10 files of maximum size arranged in descending order (path, size and type):  
1 - /var/log/one/one.exe, 10 GB, exe  
2 - /var/log/two/two.log, 10 MB, log  
etc up to 10  
TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)  
1 - /var/log/one/one.exe, 10 GB, 3abb17b66815bc7946cefe727737d295  
2 - /var/log/two/two.exe, 9 MB, 53c8fdfcbb60cf8e1a1ee90601cc8fe2  
etc up to 10  
Script execution time (in seconds) = 1.5
```
