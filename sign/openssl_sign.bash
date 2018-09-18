PRIVKEYDIR=../genkey
PUBKEYDIR=../genkey


for algo in rsa ec; do
    privkey=$PRIVKEYDIR/privkey.$algo.pem
    sigfile=inputdata.signature.$algo
    echo Using private key file: $privkey
    echo Signing to: $sigfile
    openssl pkeyutl -sign -in inputdata.txt -inkey $privkey -out $sigfile
done



