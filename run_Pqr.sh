mkdir ROG-H4-Orginal
for i in {1..103}; do
	# first write the contacts.script
	echo "Running cpptraj on index $i"

	echo " parm H4-OPC-FF10-OHm.top " > rog.script
	echo "trajin H4-OPC-FF10-OHm.prod$i.traj 1 last 1" >> rog.script
	echo "strip :WAT,Na+,Cl-" >> rog.script
        #echo "trajout $i.pqr pdb dumpq multi" >> PQR.script
	echo "radgyr out ROG-H4-orginal-$i.dat " >> rog.script
	#echo "secstruct :1-55 out Ahelix-Bsheet-unfolded-$i.gnu sumout Ahelix-Bsheet-unfolded-$i.agr " >> PQR.script
	cpptraj -i rog.script > $i.log
	
	mv ROG-H4-orginal-$i.dat ROG-H4-Orginal
	rm $i.log
done
echo "Finished"
