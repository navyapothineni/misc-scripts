$BASEDIR=$((Get-Item -Path ".\" -Verbose).FullName)
$STARTDIR="${BASEDIR}\setup"
$DEV_VIRTUALENV="${STARTDIR}\dev_virtualenv"
$GAESDKDIR="${STARTDIR}\google-cloud-sdk"
$env:PATH = $GAESDKDIR + "\bin;" + $env:PATH
$env:PYTHONPATH = $GAESDKDIR + "\bin;" + ${BASEDIR} + "\src;" + $env:PYTHONPATH
echo "Done!"