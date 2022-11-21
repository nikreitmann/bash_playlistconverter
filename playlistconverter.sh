#!/bin/bash

#________________SETUP_START________________

## PLAYLIST SOURCE FOLDER (e.g. /media/cdrom/ )
FILES_SRC="/music/music_collection/_playlists/"

## PLAYLIST DESTINATION FOLDER (e.g. /media/cdrom/ )
FILES_DST="/music/music_collection/_playlists_phone/"

## MUSIC CONTENT PATH OLD (search)
SEARCH='/music/'

## MUSIC CONTENT PATH NEW (replace)
REPLACE='/storage/3338-3332/Music/'

#________________SETUP_END__________________

# Print INFO
echo ""
echo "------------------------------"
echo "___________TechNIK____________"
echo "------------------------------"
echo "      PLAYLIST CONVERTER      "
echo "------------------------------"
echo ""

#count "/" in FILES_DST VARIABLE
SLSH=$(echo "$FILES_DST" | sed 's/\(.\)/\n\1/g' | grep "/" | wc -l)
SLSH_C=$(($SLSH+1))

#copy all playlists to playlist_phone folder
rm -rf $FILES_DST/*
cp -ar $FILES_SRC/* $FILES_DST
echo "Processing -> Copy Playlists from source"

#remove unwanted content in playlist_phone folder
rm -rf $FILES_DST/infobrowser.opml
rm -rf $FILES_DST/DPL-custom-lists
echo "Processing -> Seek and Destroy unwanted files in playlist_phone folder"

#set file permissions
chmod 777 $FILES_DST/*
echo "Processing -> set accessrights in playlist_phone folder"
echo "Processing -> convert playlists"
echo ""

# Do it
for f in $FILES_DST*
do
  foutput=$(echo $f | cut -d/ -f$SLSH_C)
  sed -i '/^#E/d' "$f"
  sed -i 's#'$SEARCH'#'$REPLACE'#g' "$f"
  sed -i '1d' "$f"
#  sed -i 's/.*/"&"/' "$f" # set quotes "" for each line
  cd $FILES_DST
  cp -ar "$foutput" "LMS_$foutput"
  rm -rf "$foutput"
  echo "$foutput done"
done

echo ""
echo "      _                "
echo "    _| |               "
echo "  _| | |               "
echo " | | | |               "
echo " | | | | __            "
echo " | | | |/  \           "
echo " |       /\ \          "
echo " |      /  \/          "
echo " |      \  /\          "
echo " |       \/ /          "
echo "  \        /           "
echo "   |     /    all done!"
echo "   |    |              "
echo ""
