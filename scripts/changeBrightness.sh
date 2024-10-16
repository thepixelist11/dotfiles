brightness=$(brightnessctl -d intel_backlight get)

amount=25
if [ $brightness -lt 50 ]; then
  amount=5
fi

echo  
if [[ "$1" == "sub" ]]; then
  brightnessctl -d intel_backlight set "$amount"-
else
  brightnessctl -d intel_backlight set +"$amount"
fi
