#!/bin/bash

# ------- VARIABLES -------
TARGET_IP="localhost"
TARGET_PORT="80"
COUNT=3

# Ask for permission first
if [[ "$EUID" -ne 0 ]]; then
	echo "[-] Error: Needs root privileges to run, try 'sudo'"
	exit 1
fi

# ------- FEEDBACKS -------
echo "[+] This is for testing hping3 tool"
echo "[+] on default loopback interface: $TARGET_IP"
echo "[+] on web port: $TARGET_PORT"
echo "[+] sending max 3 packets"

# ------- CASE -------
echo "Choose flavour of hping3:
	1 - Mask your source IP
	2 - Default"

until [[ $choice =~ ^(1|2$) ]]; do
	echo "[?] Choose between 1 or 2"
	read -p "Enter choice: " choice
done

case $choice in

	1)
		echo "[+] Using --rand-source to mask source IP"
		flavour="--rand-source"
		;;
	2)
		echo "[+] Using simple SYN"
		flavour=""
esac

echo "[*] Executing command"
sleep 2
CMD="hping3 -c $COUNT -S -p $TARGET_PORT $flavour $TARGET_IP"

# Running command
eval $CMD
