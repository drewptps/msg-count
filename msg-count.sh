#!/usr/bin/env bash
# 2021-02-07 - Drew Petipas - This is a bash script to easily determine the number of WhatsApp messages from an exported WhatsApp chat archive.

# Set parameter 1 to $zipFileArg
zipFileArg="$1";
# Extract the file to /temp and overwrite any existing files
unzip -qqod /tmp "$zipFileArg";
# Set $chatFile to the location of the chat file
chatFile=/tmp/_chat.txt;
# Count number of messages total
msgCount=$(egrep -c '\[??\/??\/??,' $chatFile);
# Count the number of images in the chat
imageCount=$(egrep -c 'image omitted' $chatFile);
# Count the number of audio messages in the chat
audioCount=$(egrep -c 'audio omitted' $chatFile);

# Set contactName
contactName=$zipFileArg;
contactName=${contactName//WhatsApp\ Chat\ \-\ /};
contactName=${contactName//\.zip/};

# Print results
echo -e "Message count for chat with $contactName\nTotal Messages: $msgCount\nImages: $imageCount\nAudios: $audioCount";

# Clean up /tmp
rm $chatFile;
