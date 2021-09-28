
file_name=train.log
 
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
echo "Current Time : $current_time"
 
new_fileName=$current_time.$file_name
echo "New FileName: " "$new_fileName"
 
cp $file_name $new_fileName
echo "You should see new file generated with timestamp on it.."

date 2>&1 | tee -a $new_fileName
nvidia-smi 2>&1 | tee -a $new_fileName
# python train_detec.py --data_detec /home/username/gsdata/Lmdb_detect --data_test_detec /home/username/gsdata/testset_detec 2>&1 | tee -a $new_fileName
python train_recog.py --data_recog /home/username/gsdata/Lmdb_recog --data_test_recog /home/username/gsdata/testset_recog 2>&1 | tee -a $new_fileName
date 2>&1 | tee -a $new_fileName

