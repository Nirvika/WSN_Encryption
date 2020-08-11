TOSROOT=/opt/tinyos-2.1.1
INTERFACES=`ls $TOSROOT/tos/interfaces | egrep -v "CVS|README"`
SYSTEM=`ls $TOSROOT/tos/system | egrep -v "CVS"`


for i in $INTERFACES
        do
        cp $TOSROOT/tos/interfaces/$i $TOSDIR/interfaces/
done

for i in $SYSTEM
        do
        cp $TOSROOT/tos/system/$i $TOSDIR/system/
done


