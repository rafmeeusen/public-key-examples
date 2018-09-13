printf "Openssl command line examples\n"
printf ""

printf "Generate rsa private key\n"
openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:2048 -out rsa_privkey.pem
openssl rsa -in rsa_privkey.pem -text -out rsa_privkey.txt

printf "Calculate rsa public key from private key\n"
openssl rsa -in rsa_privkey.pem -pubout -out rsa_pubkey.pem
openssl rsa -pubin -in rsa_pubkey.pem -text -out rsa_pubkey.txt


printf "Generate ec private key\n"
openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 -out ./ec_privkey.pem
openssl ec -in ec_privkey.pem -text -out ec_privkey.txt
printf "Calculate ec public key from private key\n"
openssl ec -in ec_privkey.pem -pubout -out ec_pubkey.pem
openssl ec -pubin -in ec_pubkey.pem -text -out ec_pubkey.txt


