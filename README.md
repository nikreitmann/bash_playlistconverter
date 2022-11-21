# bash_playlistconverter
A bash script for automated playlist *.m3u converting (changes the path of files)

## Description
I suggest doing a cronjob for this script, or you can run it manually.

The following can be defined in the script:
- ```PLAYLIST SOURCE FOLDER``` -> where the m3u's are
- ```PLAYLIST DESTINATION FOLDER``` -> where the converted m3u's goes
- ```MUSIC CONTENT PATH OLD``` -> original path for music files (script search for this string...) 
- ```MUSIC CONTENT PATH NEW``` -> new path for music files (...and replace with this string) 
