#!/bin/bash

# Purpose: Display pause prompt
function pause(){
    local message="$@"
    [ -z $message ] && message="Press [Enter] key to continue..."
    read -p "$message" readEnterKey
}

# Purpose - Display main menu on screen
function show_menu(){
    echo "==========================="
    echo "         MAIN MENU         "
    echo "==========================="
    echo "1. Take a Picture"
    echo "2. Take a Video"
    echo "3. Stream Video"
    echo "4. Take a Picture with Status"
    echo "5. Exit"
}

# Purpose - Get info about username, OS used, uptime along with how many users, IPs, and hostnames
function take_picture(){
    echo "-------------------------------------------------------"
    echo "                    TAKING A PICTURE                   "
    echo "-------------------------------------------------------"
    eval python3 take_picture.py
    echo "Your picture is saved in output.jpg"

    # pause "Press [Enter] key to continue..."
    pause
}

# Purpose - Briefly display hardware information
function take_video(){
    echo "-------------------------------------------------------"
    echo "                    TAKING A VIDEO                     "
    echo "                 Press Ctrl+C to Stop                  "
    echo "-------------------------------------------------------"
    eval python3 take_video.py
    eval clear
    echo "Your video is saved in output.avi"

    pause
}

# Purpose - Display memory size and free memory, statistical system memory information,
#           including the list of applications that use the largest CPU performance
function stream_video(){
    echo "-------------------------------------------------------"
    echo "                    STREAMING VIDEO                    "
    echo "                    Press q to Stop                    "
    echo "-------------------------------------------------------"
    eval sleep 3
    eval python3 stream_video.py
    eval clear

    pause
}

function take_picture_with_status(){
    echo "-------------------------------------------------------"
    echo "                  TRY TAKING A PICTURE                 "
    echo "-------------------------------------------------------"
    eval sudo echo 0xffff > /sys/module/uvcvideo/parameters/trace
    eval python3 take_picture.py
    dmesg | tail -8
    eval sudo echo 0 > /sys/module/uvcvideo/parameters/trace
    echo "Your picture is saved in output.jpg"

    pause
}

# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
    local c
    read -p "choose 1-5: " c

    case $c in
        1)  take_picture ;;
        2)  take_video ;;
        3)  stream_video ;;
        4)  take_picture_with_status ;;
        5)  echo "Bye Bye...."; exit 0 ;;
        *)  
            echo "Please select between 1 to 5 choice only."
            pause
    esac
}

# main logic
while true
do
    clear
    date        # Display the date
    show_menu   # Display memu
    read_input  # Wait for user input
done
