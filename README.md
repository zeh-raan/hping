# HPING

To safely test a dos attack, i used my default loopback interface IP and a kali tool

## Packages

| Tool Used | Detail                                  |
| :---      | :---:                                   |
| hping3    | To attack an IP address                 |
| tcpdump   | To watch the loopback interface traffic |

## What is loopback addresses?

Loopback(lo) addresses is simply used to represent the identity of your network device. The IP address is disconnected from our device to safely test attack commands such as hping3.

Try on your linux terminal

```bash
cat /etc/hosts
```
Should be able to see content of your default lo

## Measures taken

* Limiting packets send to 3
* Avoid flooding the IP

## Steps to run

### Make script executable

```bash
chmod +x hping.sh
```

### Monitor lo

```bash
sudo tcpdump -i lo -nn
```
### Run script

```bash
./hping.sh
```
