PRIVKEYDIR=../genkey
PUBKEYDIR=../genkey

printf "Generate signatures, and verify immediately after.\n"
for algo in rsa ec; do
    privkey=$PRIVKEYDIR/privkey.$algo.pem
    sigfile=inputdata.signature.$algo
    echo Using private key file: $privkey
    echo Signing to: $sigfile
    openssl pkeyutl -sign -in inputdata.txt -inkey $privkey -out $sigfile
    pubkey=$PUBKEYDIR/pubkey.$algo.pem
    echo Verifying with key $pubkey
    openssl pkeyutl -verify -in inputdata.txt -pubin -inkey $pubkey -sigfile $sigfile
done


