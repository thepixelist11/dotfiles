proc=$(ps -e | grep waybar)
echo $proc
if [ -z "$proc" ]
then
  waybar &
else
  killall waybar
fi
