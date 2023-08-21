# Mouse Battery Monitor and Telegram Notifier

This Bash script monitors the battery level of your wireless mouse and sends a notification to a Telegram chat when the battery level drops below a certain threshold. It utilizes the Telegram Bot API to send the notifications.

## Prerequisites

- macOS (as the script uses the `ioreg` command to gather battery information)
- `curl` command-line tool (usually pre-installed on macOS)

## Usage

1. Make sure you have a Telegram bot set up. If you don't have one, you can create a bot and obtain the bot token following the [official instructions](https://core.telegram.org/bots#botfather).

2. Determine your chat ID. You can use the [@userinfobot](https://t.me/userinfobot) on Telegram to obtain your chat ID.

3. Open the script (`mouse_battery_notifier.sh`) in a text editor.

4. Replace the following placeholders with your actual values:
   - `YOUR_BOT_ID` with your Telegram bot's ID
   - `YOUR_BOT_TOKEN` with your Telegram bot's token
   - `YOUR_CHAT_ID` with your Telegram chat ID

5. Optionally, you can adjust the `COMPARE` variable to change the battery level threshold at which the notification should be sent.

6. Open Terminal and navigate to the directory containing the script.

7. Run the script with the following command: `./mouse_battery_notifier.sh`

If you want to set a custom threshold for testing, you can provide a number as the first argument: `./mouse_battery_notifier.sh 50`


## How It Works

The script uses the `ioreg` command to obtain battery information for your wireless mouse. It compares the battery level with the threshold specified in the `COMPARE` variable (default is 20%). If the battery level is below the threshold, the script sends a notification to your specified Telegram chat using the Telegram Bot API. Additionally, a macOS notification is displayed.

## License

This project is licensed under the [MIT License](LICENSE).

Feel free to modify and adapt the script according to your needs.

---

**Note:** This script is provided as-is and may require adjustments to work with different setups or future changes in macOS or the Telegram API.
