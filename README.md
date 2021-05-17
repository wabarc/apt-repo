# APT / Debian Repository

Repository Configuration
------------------------

```bash
curl -s https://apt.wabarc.eu.org/KEY.gpg | sudo apt-key add -
echo "deb https://apt.wabarc.eu.org/ /" > /etc/apt/sources.list.d/wayback.list
apt update
apt install wayback
```

Update Repository Index
-----------------------

```bash
make build
```
