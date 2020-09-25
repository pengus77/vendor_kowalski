lunch_others_targets=()
for device in $(curl -s https://raw.githubusercontent.com/KowalskiOS/vendor_kowalski/eleven/kowalski.devices)
do
    for var in user userdebug eng; do
        lunch_others_targets+=("kowalski_$device-$var")
    done
done
