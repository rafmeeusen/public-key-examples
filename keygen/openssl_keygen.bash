printf "Openssl command line examples\n"
printf ""

printf "Generate rsa private key\n"
openssl genrsa -out rsa_privkey.pem
openssl rsa -in rsa_privkey.pem -text -out rsa_privkey.txt

printf "Calculate rsa public key from private key\n"
openssl rsa -in rsa_privkey.pem -pubout -out rsa_pubkey.pem
openssl rsa -pubin -in rsa_pubkey.pem -text -out rsa_pubkey.txt


