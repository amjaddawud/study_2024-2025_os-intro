lockfile="./lock.file"
exec {fn}>$lockfile

while test -f "$lockfile"
do
if flock -n ${fn}
then
        echo "file is locked"
        sleep 5
        echo "file is unlocked"
        flock -u ${fn}
else
        echo "file is locked"
        sleep 5
fi
done
