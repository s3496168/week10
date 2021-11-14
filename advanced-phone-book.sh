#!/bin/bash
#inspired by: https://github.com/hananabilabd/Phonebook-using-bash-script/blob/master/phonebook

#variables
SLEEP=/bin/sleep
QUIT=0
FILE=records.txt
PRINTF=/usr/bin/printf

#If the records file does not exist, create it
if ! [[ -f "$FILE" ]] ; then
    touch records.txt
    fi

#start menu
menu(){
    $CLEAR
    $PRINTF "\n"
    $PRINTF "****Phone booh menu****\n"
    $PRINTF "\n"
    $PRINTF " 1) Add a person\n"
    $PRINTF " 2) Search for a person\n"
    $PRINTF "\n"
    $PRINTF " Q) Quit this menu system\n"
    $PRINTF "\n"
    $PRINTF "\n"
    $PRINTF " Enter your choice (please) ==> "
    return

}

#end menu
########################################

#Actual script entry point is here
########################################

while [ $QUIT -eq 0 ] ; do
    menu

    read -r CHOICE
    case $CHOICE in
        1)
            $PRINTF "Create a new record\n"
            $PRINTF "\n"
            $PRINTF "Please enter the person's first name: \n"
            read -r name
            if [[ ! $name ]] ; then
                $PRINTF "Please enter a first name: \n"
                read -r name
            fi
            $PRINTF "Please enter the person's phone number: \n"
            read -r phoneNo
            if [[ ! $phoneNo ]] ; then
                $PRINTF "Please enter a phone number: \n "
                read -r phoneNo
            fi

            echo "$name" "$phoneNo" >> records.txt
            $SLEEP 3
            $PRINTF "Thank you for this entry\n"
            ;;
        2)
            $PRINTF "Search a record\n"
            $PRINTF "Please enter the first letter of the name you wish to search for: \n"
            read -r SEARCH
            ###################It starts not not work here################
            $PRINTF "Letter is $SEARCH name is $FILE\n"
            #FOUND=$(grep -i "^[A-Z] $SEARCH $FILE")
            FOUND=$(grep -i "^$SEARCH $FILE")
            #$PRINTF "It is $FOUND"
            if [[ -z "$FOUND" ]] ; then
                $PRINTF "Sorry, no entry found\n"
            else
                $PRINTF "Hooray!"
                grep -i "^$SEARCH $FILE" | while read -r line ; do
                i=$(( i + 1 ))
                $PRINTF "$i $line\n"
            done
           ###############The rest of it works fine##################
            fi
            $SLEEP 3
            ;;
        [Qq])
            QUIT=1;;
        ?)
            $PRINTF "\n"
            $PRINTF "\n"
            $PRINTF "Valid options are 1, 2 and Q\n"
            $SLEEP 3;;
    esac

done





