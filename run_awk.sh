for j in {28..103}; do
	echo "track-$j"
	frame_count=0
	#num_frame=`ls track-$j | wc -l`
	for file in `ls track-$j`; do
		frame_count=$(($frame_count+1))
		echo "$frame_count `awk -f contact_map.awk track-$j/$file | wc -l`" >> contacts-Alexey$j.dat
	done
done

