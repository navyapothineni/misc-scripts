$STARTDIR=$((Get-Item -Path ".\" -Verbose).FullName)
$env:PYTHONPATH = "${STARTDIR}\setup\dev-virtualenv\Lib\site-packages;" + "${STARTDIR}\src;" + $env:PYTHONPATH 
echo "Done!"