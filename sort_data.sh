for dir in $1/*;
do
  echo $dir
  class=$(echo $dir | rev | cut -d/ -f1 | rev)
  class_num=$(echo $class | cut -d. -f1)
  class_name=$(echo $class | cut -d. -f2)
  echo "$class_num $class_name"

  for file in $dir/*;
  do
    new_filename=$(echo $file | rev | cut -d/ -f1 | rev)
    new_filename=$(sed "s/$class_name/$class_num/i" <<< $new_filename)
    new_filename=$(echo $new_filename | cut -d_ -f1-2)
    echo $file
    cp $file $2/$new_filename.jpg
  done
done
