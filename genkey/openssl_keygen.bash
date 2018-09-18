
PRIV_RSA_PEM=privkey.rsa.pem
PRIV_RSA_TXT=privkey.rsa.txt
PUB_RSA_PEM=pubkey.rsa.pem
PUB_RSA_TXT=pubkey.rsa.txt

PRIV_EC_PEM=privkey.ec.pem
PRIV_EC_TXT=privkey.ec.txt
PUB_EC_PEM=pubkey.ec.pem
PUB_EC_TXT=pubkey.ec.txt


printf "Openssl command line examples\n"
printf ""

printf "Generate rsa private key\n"
openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:2048 -out $PRIV_RSA_PEM
openssl rsa -in $PRIV_RSA_PEM -text -out $PRIV_RSA_TXT
printf "Calculate rsa public key from private key\n"
openssl rsa -in $PRIV_RSA_PEM -pubout -out $PUB_RSA_PEM
openssl rsa -pubin -in $PUB_RSA_PEM -text -out $PUB_RSA_TXT


printf "Generate ec private key\n"
openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 -out $PRIV_EC_PEM
openssl ec -in $PRIV_EC_PEM -text -out $PRIV_EC_TXT
printf "Calculate ec public key from private key\n"
openssl ec -in $PRIV_EC_PEM -pubout -out $PUB_EC_PEM
openssl ec -pubin -in $PUB_EC_PEM -text -out $PUB_EC_TXT


