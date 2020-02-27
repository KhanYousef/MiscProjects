clear

echo -n "Enter a stock symbol: "
read symbol

wget -qO- https://cloud.iexapis.com/stable/stock/market/batch?symbols=$symbol\&types=quote\&token=pk_f9dc118fc47f4496a7a2e9e67b354e32 >st1

sed s/",\""/"\n"/g <st1 >st2

nam=`grep companyName   st2 | awk -F: '{print $2}' | sed s/"\""/""/g | cut -c1-20`
pri=`grep latestPrice   st2 | awk -F: '{print $2}'`
chg=`grep "^change\""   st2 | awk -F: '{print $2}'`
vol=`grep volume        st2 | awk -F: '{print $2}'`

echo $symbol
echo "Company Name =" $nam
echo $pri
echo $chg
echo $vol

sleep 3

clear

chgFlag=`echo $chg | grep "-" | wc -l`
if [ $chgFlag -eq 0 ]
then
        # green and black
        tput setab 2
        tput setaf 0
else
        # red and white
        tput setab 1
        tput setaf7

fi

tput cup 10 20
echo "                    "

tput cup 11 20
echo "                    "

tput cup 12 20
echo "                    "

tput cup 13 20
echo "                    "

tput cup 14 20
echo "                    "






tput cup 10 20
echo "                    "

tput cup 11 20
echo "                    "

tput cup 12 20
echo "                    "

tput cup 13 20
echo "                    "

tput cup 14 20
echo "                    "



# now print the symbols
tput cup 10 20
echo "         $symbol"

tput cup 11 20
echo $nam

tput cup 12 20
echo $pri

tput cup 13 20
echo $chg

tput cup 14 20
echo $vol


tput setab 0
tput setaf 7

