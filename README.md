# tgnotify

A very simple & useful Telegram notification agent for the command line:

*you pipe it -> you get it!*

## Usage examples

#### For sending a message to your notification bot
```bash
echo "WOW\!" | python main.py
```

#### For sending you the disk usage
```bash
df -h | python main.py
```

#### For sending uptime
```bash
uptime --pretty | python main.py
```

#### For sending the packages available to update your Arch Linux system
```bash
yay -Sy &> /dev/null && yay -Qu | python main.py
```
#### For getting a notification about your server up and running
```bash
echo "$ (hostname) is up and running\!" | python main.py
```

**...or simply everything you can pipe!**

Check the `scripts` folder for some examples!

## Installation

```bash
python -m pip install virtualenv
python -m virtualenv venv
source ./venv/bin/activate
cp .env.example .env
vim .env # Insert your Botfather-generated token and your Telegram user chat id here!
echo "That's my first message!" | python main.py
```

## As crontab service

Ubuntu example
```bash
SHELL=/usr/bin/zsh
0 10 * * * source /root/tgnotify/venv/bin/activate && /root/tgnotify/scripts/general_ubuntu.sh | python /root/tgnotify/main.py && deactivate
```

## License
This software is licensed under the WTFPL License. See LICENSE file for more information.
