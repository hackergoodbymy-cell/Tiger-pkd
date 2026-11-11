#!/data/data/com.termux/files/usr/bin/bash
set -e
echo "Installing TIGER KHAN PKD logo..."
pkg update -y
pkg install -y figlet toilet ruby
command -v lolcat >/dev/null 2>&1 || gem install lolcat
touch "$HOME/.bashrc"
if grep -q '^# >>> TIGER KHAN PKD LOGO >>>$' "$HOME/.bashrc"; then
  sed '/^# >>> TIGER KHAN PKD LOGO >>>$/,/^# <<< TIGER KHAN PKD LOGO <<<$/{d;}' "$HOME/.bashrc" > "$HOME/.bashrc.tmp"
  mv "$HOME/.bashrc.tmp" "$HOME/.bashrc"
fi
cat >> "$HOME/.bashrc" <<'LOGO'

# >>> TIGER KHAN PKD LOGO >>>
clear
if command -v toilet >/dev/null 2>&1; then
  if command -v lolcat >/dev/null 2>&1; then
    toilet -f big "TIGER KHAN" | lolcat
    toilet -f big "PKD" | lolcat
  else
    toilet -f big "TIGER KHAN"
    toilet -f big "PKD"
  fi
else
  printf '\n===== TIGER KHAN PKD =====\n'
fi
printf '\n  CYBER SECURITY | TERMUX | LINUX\n'
printf '  Be Safe • Be Smart • Learn Ethically\n'
printf '  Made by TIGER KHAN PKD\n\n'
# <<< TIGER KHAN PKD LOGO <<<
LOGO
echo "Done! Close and reopen Termux to see the logo."
