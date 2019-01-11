
#!/bin/bash

TESTMODE2=$(cat testmode.txt)
touch REBUY.txt
touch REBUY2.txt
#Enter your Api Key Here
APIKEY=ENTER YOUR API KEY
APISECRET=ENTER YOUR API KEY
#END API KEY
#Bottom Price
BOTTOMMODIFY=150
#END BOTTOM PRICE
TOPMODIFY=300

cat $BOTTOMMODIFY > bottommodify.txt

rm ethsell.js
touch ethsell.js
cat >ethsell.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
  APIKEY: '$APIKEY',
  APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: true // If you want to use sandbox mode where orders are simulated
});
binance.prices('ETHUSDT', (error, ticker) => {
  console.log("", ticker.ETHUSDT);
});
EOL
touch ethbal.js
cat >ethbal.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
  APIKEY: '$APIKEY',
  APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: true // If you want to use sandbox mode where orders are simulated
});
binance.balance((error, balances) => {
 // console.log("balances()", balances);
  console.log(balances.ETH.available);
});
EOL
touch ethbal2.js
cat >ethbal2.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
APIKEY: '$APIKEY',
APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: true // If you want to use sandbox mode where orders are simulated
});
binance.balance((error, balances) => {
 // console.log("balances()", balances);
  console.log(balances.ETH.available);
});
EOL
# best ask price
#depth.get_asks_lowest_price()
#for i in $(seq 1 100); do
# ETHBAL=$(node ethbal.js | cut -c1-4 | awk '{print $1 / 3000}' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
       #  ETHBAL2=$(node ethbal2.js | cut -c1-4 | awk '{print $1 / 27}'  | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
ETHBAL=$(echo 0.02 4 | awk '{print ($2 / 125) + $1}')
ETHBAL2=$(echo 0.02 4 | awk '{print ($2 / 125) + $1}')

echo 0.0117 > modify.txt
TOP=$TOPMODIFY
echo $ETHBAL $ETHBAL2
i=5
while (( i < 30 )); do

 TOTALETH1=$(node ethbal.js | cut -c1-6 | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
 TOTALETH2=$(node ethbal2.js | cut -c1-6 | awk '{printf "%.5f\n", $1}' | awk '{print $1}')

echo $ETHBAL $ETHBAL2
#    TOP=""
    BOTTOM=$(cat bottommodify.txt)
    VARIATION=$(echo $TOP $BOTTOM | awk '{print $1 - $2}')
       	#BOTTOM MATH
		BOTTOM20=$(echo $VARIATION $BOTTOM | awk '{print (($1 * 0.011) + $2) }'  | cut -c1-4 | sed 's/\.//g')
		BOTTOM65=$(echo $VARIATION $BOTTOM | awk '{print (($1 * 1) + $2) }')
		BOTTOMVARIATION=$(echo $BOTTOM20 $BOTTOM65 | awk '{print ($2 - $1) / 17}' | cut -c1-2)
	#TOPMATH
	echo bottomvariation $BOTTOMVARIATION
		BOTTOM66=$(echo $VARIATION $BOTTOM | awk '{print (($1 * 0.50) + $2) }' | cut -c1-4 | sed 's/\.//g')
		BOTTOM100=$(echo $VARIATION $BOTTOM | awk '{print (($1 * 1) + $2) }')
		TOPVARIATION=$(echo $BOTTOM66 $BOTTOM100 | awk '{print ($2 - $1) / 5}'  | cut -c1-1)
	echo $TOPVARIATION top variation
       	#SELL LEVELS BOTTOM 30 sells sed -i 's/$BOTTOM20 | /$BOTTOM20 | awk loop.sh
		A1=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 1) + $2}')
		A2=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 2) + $2}')
		A3=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 3) + $2}')
		A4=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 4) + $2}')
		A5=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 5) + $2}')
		A6=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 6) + $2}')
		A7=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 7) + $2}')
		A8=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 8) + $2}')
		A9=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 9) + $2}')
		A10=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 10) + $2}')
		A11=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 11) + $2}')
		A12=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 12) + $2}')
		A13=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 13) + $2}')
		A14=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 14) + $2}')
		A15=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 15) + $2}')
		A16=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 16) + $2}')
		A17=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 17) + $2}')
		A18=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 18) + $2}')
		A19=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 19) + $2}')
		A20=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 20) + $2}')
		A21=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 21) + $2}')
		A22=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 22) + $2}')
		A23=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 23) + $2}')
		A24=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 24) + $2}')
		A25=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 25) + $2}')
		A26=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 26) + $2}')
		A27=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 27) + $2}')
		A28=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 28) + $2}')
		A29=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 29) + $2}')
		A30=$(echo $BOTTOMVARIATION $BOTTOM | awk '{print ($1 * 30) + $2}')
		#SELL LEVELS TOP 70 SELLS # sed -i 's/) + $2}')/) + $2}')/g'
		 A31=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 21)}')
                A32=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 32)}')
                A33=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 33)}')
                A34=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 34)}')
                A35=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 35)}')
                A36=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 36)}')
                A37=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 37)}')
                A38=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 38)}')
                A39=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 39)}')
                A40=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 40)}')
                A41=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 41)}')
                A42=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 42)}')
                A43=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 43)}')
                A44=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 44)}')
                A45=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 45)}')
                A46=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 46)}')
                A47=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 47)}')
                A48=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 48)}')
                A49=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 49)}')
                A50=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 50)}')
                A51=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 51)}')
                A52=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 52)}')
                A53=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 53)}')
                A54=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 54)}')
                A55=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 55)}')
                A56=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 56)}')
                A57=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 57)}')
                A58=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 58)}')
                A59=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 59)}')
                A60=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 60)}')
                A61=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 61)}')
                A62=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 62)}')
                A63=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 63)}')
                A64=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 64)}')
                A65=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 65)}')
                A66=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 66)}')
                A67=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 67)}')
                A68=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 68)}')
                A69=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 69)}')
                A70=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 70)}')
                A71=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 71)}')
                A72=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 72)}')
                A73=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 73)}')
                A74=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 74)}')
                A75=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 75)}')
                A76=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 76)}')
                A77=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 77)}')
                A78=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 78)}')
                A79=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 79)}')
                A80=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 80)}')
                A81=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 81)}')
                A82=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 82)}')
                A83=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 83)}')
                A84=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 84)}')
                A85=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 85)}')
                A86=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 86)}')
                A87=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 87)}')
                A88=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 88)}')
                A89=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 89)}')
                A90=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 90)}')
                A91=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 91)}')
                A92=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 92)}')
                A93=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 93)}')
                A94=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 94)}')
                A95=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 95)}')
                A96=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 96)}')
                A97=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 97)}')
                A98=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 98)}')
                A99=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 99)}')
                A100=$(echo $TOPVARIATION $BOTTOM $BOTTOMVARIATION | awk '{print ($3 * 7 + $2) + ($1 * 100)}')


	       PRICE2="2280"
#for i in $(seq 1 100); do
V=$(("A$i"))

if [ 1 == 1 ]; then
#  ETHBAL=$(node ethbal.js | cut -c1-4 | awk '{print $1 / 30}'  | cut -c1-2)
#         ETHBAL2=$(node ethbal2.js | cut -c1-4 | awk '{print $1 / 30}'  | cut -c1-2)

#	       ETH=$(node ethsell.js | cut -c4-7 | sed 's/\.//g')
	#	if [ "$V" != ] && [ "$ETH" != ] && [ "$ETH" -lt "$V" ]; then
 while true; do
TESTMODE2=$(cat testmode.txt)
  BOTTOM=$(cat bottommodify.txt)
        MODIFIER=$(cat modify.txt)

#ETHBAL=$(echo 100 $i | awk '{print (($2 + 1) * 2) + $1}')
#ETHBAL2=$(echo 130 $i | awk '{print (($2 + 1) * 4) + $1}')
REBUY=$(cat REBUY.txt)
REBUY2=$(cat REBUY2.txt)

touch REBUY.txt
touch REBUY2.txt
#echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.1))) / 10000}' | cut -c1-6 > REBUY.txt      
#echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 8))) / 10000}' | cut -c1-6 > REBUY2.txt
#REBUY=$(echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.1))) / 10000}' | cut -c1-6)
#REBUY2=$(echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 8))) / 10000}' | cut -c1-6)
 TOTALETH1=$(node ethbal.js | cut -c1-9 | awk '{printf "%.2f\n", $1}' | awk '{print $1}') 
 TOTALETH2=$(echo 0)
#ETHBALR=$(echo $REBUY $V $ETHBAL | awk '{print (( $2 / ($1 * 10000)) * $3) / 1.0016 }' | awk '{printf "%.1f\n", $1}' | awk '{print $1}')
#ETHBAL2R=$(echo $REBUY2 $V $ETHBAL2 | awk '{print (( $2 / ($1 * 10000)) * $3) / 1.0016 }' | awk '{printf "%.1f\n", $1}' | awk '{print $1}')
touch pp2.txt
touch pp3.txt
echo $REBUY $V $ETHBAL | awk '{print (( $2 / ($1 * 10000)) * $3) / 1.0016 }' | awk '{printf "%.1f\n", $1}' | awk '{print $1}' > pp2.txt
echo $REBUY2 $V $ETHBAL2 | awk '{print (( $2 / ($1 * 10000)) * $3) / 1.0016 }' | awk '{printf "%.1f\n", $1}' | awk '{print $1}' > pp3.txt
V=$(("A$i"))
G=$((i - 3))
G=$(("A$G"))

	
	 ETH=$(node ethsell.js | awk '{printf "%.0f\n", $1}' | awk '{print $1}')
#	ETHSELLING=$(echo $ETH $ETHBAL | awk '{print  $1 / 10 * $2}' | cut -c1-4)
#	ETHSELLING2=$(echo $ETH $ETHBAL2 | awk '{print $1 / 10 * $2}' | cut -c1-4)
if [ $ETH -lt $G ]; then
TOP="300"
#TOP2=$(("$TOP"))
#TOP=$(echo $TOP2 | awk '{print $1 + 1}')
i=$((i - 1))
ETHBAL=$(echo 0.59 $i | awk '{print ((($2 / 4) * $1) + $1 + $1 + $1)}' | awk '{printf "%.3f\n", $1}' | awk '{print $1}')
ETHBAL2=$(echo 0)
L=$(("A$i"))  
 echo $BOTTOM $L $MODIFIER $i | awk '{print (($2 - $1 * ($3 * ($4 / 0.3))))}' | awk '{printf "%.0f\n", $1}' > REBUY.txt
 echo $BOTTOM $L $MODIFIER $i | awk '{print (($2 - $1 * ($3 * ($4 / 0.3))))}' | awk '{printf "%.0f\n", $1}' > REBUY2.txt 

REBUY=$(cat REBUY.txt)
REBUY2=$(cat REBUY2.txt)
ETHBALR=$(echo $REBUY $L $ETHBAL | awk '{print (( $2 / ($1)) * $3) / 1.0016 }' | awk '{printf "%.4f\n", $1}' | awk '{print $1}')
ETHBAL2R=$(echo $REBUY2 $L $ETHBAL2 | awk '{print (( $2 / ($1)) * $3) / 1.0016 }' | awk '{printf "%.4f\n", $1}' | awk '{print $1}')
break


else
if [ $V -ge $A6 ] && [ $V -lt $A6 ]; then
echo 0.01 > modify.txt  
MODIFIER=$(cat modify.txt)
ETHBAL=$(echo 0.03 $i | awk '{print (($2 + 1) / 125) + $1}')
ETHBAL2=$(echo 0.03 $i | awk '{print (($2 + 1) / 125) + $1}')
LL=$(echo $i | awk '{print $1 + 1}')
l2=$(echo $LL | awk '{print "$A"$1}')
touch ppp.txt
echo $l2 > ppp.txt
V=$((V + 1))
echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 10)))}' | awk '{printf "%.4f\n", $1}' | awk '{print $1}' > REBUY.txt
echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 10)))}' | awk '{printf "%.4f\n", $1}' | awk '{print $1}' > REBUY2.txt
REBUY=$(cat REBUY.txt)
REBUY2=$(cat REBUY.txt)
ETHBALR=$(echo $REBUY $V $ETHBAL | awk '{print (($2) / $1 - 1) * 1.0023 * $3 + $3 }' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
ETHBAL2R=$(echo $REBUY2 $V $ETHBAL2  | awk '{print (($2) / $1 - 1) / 1.0023 * $3 + $3 }' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
break

#TOP="1200"
# ETHBAL=$(node ethbal.js | cut -c1-6 | awk '{print $1 / 5}' | awk '{printf "%.5f\n", $1}' | awk '{print $1}') 
# ETHBAL2=$(node ethbal2.js | cut -c1-6 | awk '{print $1 / 5}' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
# TOTALETH1=$(node ethbal.js | cut -c1-6 | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
# TOTALETH2=$(node ethbal2.js | cut -c1-6 | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
#        echo 0.0051 > modify.txt
#touch newlevel.txt
#        sleep 0.2
#        cat modify.txt | awk '{print $1 * 44}' > newlevel.txt#
#	cat newlevel.txt > modify.txt
#MODIFIER=$(cat newlevel.txt)
#LL=$(echo $i | awk '{print $1 + 1}')
#l2=$(echo $LL | awk '{print "$A"$1}')

#echo $BOTTOM $l2 $MODIFIER| awk '{print (($2 - $1 * ($3 * 4.9)))}' | awk '{printf "%.0f\n", $1}' | awk '{print $1}' > REBUY.txt
#echo $BOTTOM $l2 $MODIFIER| awk '{print (($2 - $1 * ($3 * 13)))}' | awk '{printf "%.0f\n", $1}' | awk '{print $1}' > REBUY2.txt

#REBUY=$(cat REBUY.txt)  
#REBUY2=$(cat REBUY2.txt)

#ETHBALR=$(echo $REBUY $V $ETHBAL | awk '{print (($2) / $1 - 1) * 1.0023 * $3 + $3 }' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
#ETHBAL2R=$(echo $REBUY2 $V $ETHBAL2  | awk '{print (($2) / $1 - 1) / 1.0023 * $3 + $3 }' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')



        break
else
if [ $V -ge $A4 ] && [ $V -lt $A4 ]; then
echo 0.01 > modify.txt
MODIFIER=$(cat modify.txt)
ETHBAL=$(echo 0.03 $i | awk '{print (($2 + 1) / 125) + $1}')
ETHBAL2=$(echo 0.03 $i | awk '{print (($2 + 1) / 125) + $1}')
LL=$(echo $i | awk '{print $1 + 1}')
l2=$(echo $LL | awk '{print "$A"$1}')
touch ppp.txt
echo $l2 > ppp.txt
V=$((V + 1))
echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.8)))}' | awk '{printf "%.0f\n", $1}' | awk '{print $1}' > REBUY.txt
echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.8)))}' | awk '{printf "%.0f\n", $1}' | awk '{print $1}' > REBUY2.txt
REBUY=$(cat REBUY.txt)
REBUY2=$(cat REBUY.txt)
ETHBALR=$(echo $REBUY $V $ETHBAL | awk '{print (($2) / $1 - 1) * 1.0023 * $3 + $3 }' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
ETHBAL2R=$(echo $REBUY2 $V $ETHBAL2  | awk '{print (($2) / $1 - 1) / 1.0023 * $3 + $3 }' | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
break 
else
if [ $V -gt $A100 ] && [ $ETH -ge $V ]; then

 TOTALETH1=$(node ethbal.js | cut -c1-6 | awk '{printf "%.5f\n", $1}' | awk '{print $1}') 
 TOTALETH2=$(node ethbal2.js | cut -c1-6 | awk '{printf "%.5f\n", $1}' | awk '{print $1}')
TOP=$TOPMODIFY
#begin market orders
                    echo   BLAH BLAH COMMAND on $V $ETH price SELLCOMMAND
        touch ethselling.js
        cat >ethselling.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
  APIKEY: '$APIKEY',
  APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2  // If you want to use sandbox mode where orders are simulated
});
binance.marketSell("ETHUSDT", $ETHBAL);
EOL
     touch ethselling2.js
        cat >ethselling2.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
APIKEY: '$APIKEY',
APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2 //f you want to use sandbox mode where orders are simulated
});
binance.marketSell("ETHUSDT", $ETHBAL2);
EOL
node ethselling.js
echo $i
echo 1
echo 1
echo 1
echo 1
sleep 0.5
node ethselling2.js
echo $i
echo 1
echo 1
echo 1
echo 1
sleep 6
touch ethbuying2.js
  cat >ethbuying2.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
APIKEY: '$APIKEY',
APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2 //f you want to use sandbox mode where orders are simulated
});
binance.buy("ETHUSDT", $ETHBAL2R, $REBUY);
EOL
 touch ethbuying.js
        cat >ethbuying.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
  APIKEY: '$APIKEY',
  APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2 // If you want to use sandbox mode where orders are simulated
});
binance.buy("ETHUSDT", $ETHBAL2R, $REBUY2);
EOL

        sleep 4
        node ethbuying.js
        echo $i
        echo 1
        echo 1
        echo 1
        echo 1

        sleep 0.9
        node ethbuying2.js
        echo $i
        echo 1
        echo 1
        echo 1
        echo 1
#end market orders
#limit order rebuys below
#binance.buy("ETHUSDT", $ETHBAL2, $REBUY);
#binance.buy("ETHUSDT", $ETHBAL, $REBUY);
ETHBAL=$(echo 0.04 $i | awk '{print (($2 + 1) / 125) + $1}')
ETHBAL2=$(echo 0.04 $i | awk '{print (($2 + 1) / 125) + $1}')
echo 0.02481 > modify.txt
MODIFIER=$(cat modify.txt)
LL=$(echo $i | awk '{print $1 + 1}')
l2=$(echo $LL | awk '{print "$A"$1}')
V=$((V + 1))
echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.1))) / 10000}' | cut -c1-6 > REBUY.txt          
echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.1))) / 10000}' | cut -c1-6 > REBUY2.txt
REBUY=$(cat REBUY.txt)
REBUY2=$(cat REBUY.txt)



#end limit orders
                touch sold.txt
sleep 5
                echo sold at $ETH at $V >> sold.txt
         echo $i


break

else
	if [ $ETH -ge $V ]; then

#begin market orders
		    echo   BLAH BLAH COMMAND on $V $ETH price SELLCOMMAND
	touch ethselling.js
	cat >ethselling.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
  APIKEY: '$APIKEY',
  APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2  // If you want to use sandbox mode where orders are simulated
});
binance.marketSell("ETHUSDT", $ETHBAL);
EOL
     touch ethselling2.js
        cat >ethselling2.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
APIKEY: '$APIKEY',
APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2 //f you want to use sandbox mode where orders are simulated
});
binance.marketSell("ETHUSDT", $ETHBAL2);
EOL
node ethselling.js
echo $i
echo 1
echo 1
echo 1
echo 1
#node ethselling2.js
echo $i
echo 1
echo 1
echo 1
echo 1
sleep 6.5
touch ethbuying2.js
        cat >ethbuying2.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
APIKEY: '$APIKEY',
APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2 //f you want to use sandbox mode where orders are simulated
});
//binance.buy("ETHUSDT", $ETHBAL2R, $REBUY2);
binance.buy("ETHUSDT", $ETHBAL2R, $REBUY2, {stopPrice: $REBUY2, type: "TAKE_PROFIT_LIMIT"});
EOL
 touch ethbuying.js
        cat >ethbuying.js <<EOL
const Binance = require('node-binance-api');
const binance = new Binance().options({
  APIKEY: '$APIKEY',
  APISECRET: '$APISECRET',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: $TESTMODE2 // If you want to use sandbox mode where orders are simulated
});
//binance.buy("ETHUSDT", $ETHBALR, $REBUY);
binance.buy("ETHUSDT", $ETHBALR, $REBUY, {stopPrice: $REBUY, type: "TAKE_PROFIT_LIMIT"});
EOL

#	sleep 4
	node ethbuying.js
	echo $i
	echo 1
	echo 1
	echo 1
	echo 1

#	sleep 0.9
#	node ethbuying2.js
	echo $i
	echo 1
	echo 1
	echo 1
	echo 1
#end market orders
touch proffit.txt
touch total.txt
DATESOLD=`date +'%a %b %e %Y%n%I:%M:%S %p'`
echo $ETHBAL $ETHBALR $ETHBAL2 $ETHBAL2R $DATESOLD | awk '{print ($2 - $1) " ETH Exchange 1 " ($4 - $3) " Exchange 2 ETH " $5" " $6 " " $7 " " $8 " " $9 " " $10}'  >> proffit.txt
touch ../history.csv
#echo $ETHBAL $ETHBALR $ETHBAL2 $ETHBAL2R $DATESOLD  | awk '{print $5" "$6" "$7" "$8" "$9" "$10" "",ADA,"$1","$2","($2 - $1)","$3","$4","($4 - $3)","(($4 - $3) + ($2 - $1))}' >>$
echo DATE,COIN,SOLD1,BOUGHT1,PROFFIT1,SOLD2,BOUGHT2,PROFFIT2,DEAL PROFFIT,CUMULATIVE PROFFIT
        ADDED=$(cat proffit.txt | tail -n1 | awk '{print $1 + $5}')
touch adding.txt
touch added.txt
        ADDING=$(echo $ETHBAL $ETHBALR $ETHBAL2 $ETHBAL2R | awk '{print ($2 - $1) + ($4 - $3)}')
        OLDBAL=$(cat added.txt)
        echo $ADDED $OLDBAL | awk '{print $1 + $2 " Total"}' >> proffit.txt
echo $ADDED $OLDBAL | awk '{print $1 + $2}' > added.txt
sleep 0.3
NEWADDED=$(cat added.txt)
echo $ETHBAL $ETHBALR $DATESOLD $NEWADDED $TESTMODE2 $ETHBAL2 $ETHBAL2R $ETH $REBUY $V | awk '{print $3" "$4" "$5" "$6" "$7" "$8" "",ETH,"($1)","($2)","(($2) - ($1))","($11)","($12)","(($12) - ($11))","(($2) - ($1)) + (($12) - ($11))","$9","$10",$"(($9) + (($2) - ($1)) + (($12) - ($11))) * $13",TAKE_PROFIT_LIMIT,$"$13",$"$14","$15}' >> ../history.csv

#echo $ETHBAL $ETHBALR $DATESOLD $NEWADDED $TESTMODE2 | awk '{print $3" "$4" "$5" "$6" "$7" "$8" "",ETH,"$1","$2","($2 - $1)",N/A,N/A,N/A,"($2 - $1)","($9 + ($2 - $1))","$10}' >> ../history.csv
sleep 0.1
cp ../history.csv /var/www/html/history.csv
echo DATE,COIN,SOLD1,BOUGHT1,PROFFIT1,SOLD2,BOUGHT2,PROFFIT2,DEAL PROFFIT,CUMULATIVE PROFFIT,TESTMODE
TOP=$TOPMODIFY
#TOP2=$(("$TOP"))
#TOP=$(echo $TOP2 | awk '{print $1 + 1}')
i=$((i + 1))
ETHBAL=$(echo 0.4 $i | awk '{print (($2 * $1) + $1 + $1 + $1)}')
ETHBAL2=$(echo 0)
L=$(("A$i"))  
 echo $BOTTOM $L $MODIFIER $i | awk '{print (($2 - $1 * ($3 * ($4 / 0.8))))}' | awk '{printf "%.0f\n", $1}' > REBUY.txt
 echo $BOTTOM $L $MODIFIER $i | awk '{print (($2 - $1 * ($3 * ($4 / 0.8))))}' | awk '{printf "%.0f\n", $1}' > REBUY2.txt 

REBUY=$(cat REBUY.txt)
REBUY2=$(cat REBUY2.txt)
ETHBALR=$(echo $REBUY $L $ETHBAL | awk '{print (( $2 / ($1)) * $3) / 1.0016 }' | awk '{printf "%.4f\n", $1}' | awk '{print $1}')
ETHBAL2R=$(echo $REBUY2 $L $ETHBAL2 | awk '{print (( $2 / ($1)) * $3) / 1.0016 }' | awk '{printf "%.4f\n", $1}' | awk '{print $1}')
#limit order rebuys below
#binance.buy("ETHUSDT", $ETHBAL2, $REBUY);
#binance.buy("ETHUSDT", $ETHBAL, $REBUY);
#ETHBAL=$(echo 0.01 $i | awk '{print (($2 + 1) / 60) + $1}')
#ETHBAL2=$(echo 0.01 $i | awk '{print (($2 + 1) / 60) + $1}')
#echo 0.0061 > modify.txt
#MODIFIER=$(cat modify.txt)
#LL=$(echo $i | awk '{print $1 + 1}')
#l2=$(echo $LL | awk '{print "$A"$1}')
#V=$((V + 2))
#echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.9)))}' | awk '{printf "%.5f\n", $1}' | awk '{print $1}' > REBUY.txt
#echo $BOTTOM $V $MODIFIER| awk '{print (($2 - $1 * ($3 * 1.9)))}' | awk '{printf "%.5f\n", $1}' | awk '{print $1}' > REBUY2.txt##
#
#REBUY=$(cat REBUY.txt)
#REBUY2=$(cat REBUY.txt)

#end limit orders
echo sleeping 5 minutes for sell on bullrun
		touch sold.txt
sleep 2
		echo sold at $ETH at $V >> sold.txt
	 echo $i
		break
else
	echo BOT 1 ETH
		echo $ETHBAL $TOTALETH1 $ETHBALR | awk '{print $2 " ETH Available to sell on exchange 1, Sell " (($1)) " Rebuy " ($3)}'
		echo $ETHBAL2 $TOTALETH2 $ETHBAL2R | awk '{print ($2)  " ETH Available to sell on exchange 2, Sell " (($1))  " Rebuy " ($3)}'
		echo $ETH $V $i $TOP $BOTTOM $A30 | awk '{print "$" ($1) " Selling at $" ($2 ) " For " $3 " of 17 sells,upto $" ($4) " The Bottom is$" ($5)}'
		echo $ETH $V $REBUY2 $REBUY $TESTMODE2 API-DOWN | awk '{print $2 / $1 *100 -100 "% to sell with a rebuy of $" $3 " and $" $4 " TestMode : " $5}'
		sleep 8
touch levels.txt
echo $A1 $A1 $A2 $A3 $A4 $A5 $A6 $A7 $A8 $A9 $A10 $A11 $A12 $A13 $A14 $A15 $A16 $A17 $A18 $A19 $A20 > levels.txt
echo $A21 $A22 $A23 $A24 $A25 $A26 $A27 $A28 $A29 >> levels.txt
						fi
					fi
				fi 
			fi
		fi
	    done
	else
	    echo ON $V NO MATC
	    sleep 3
	
	    fi
done;


