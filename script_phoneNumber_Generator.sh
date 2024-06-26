# Set the default length of a formatted telephone number.
formatLength=14




# Generate one hundred random telephone numbers.
for i in {1..100}; do
  # Generate initial telephone number.
  telephone=`echo "(${RANDOM:0:3}) ${RANDOM:0:3}-${RANDOM:0:4}"`
  
  # Get the length of the telephone number as integer.
  length=`echo -n ${telephone} | wc -c`
  
  # Calculate any shortfall.
  short=$((${formatLength}-${length}))
  
  # Check if the telephone number is too short.
  if [[ ${short} > 0 ]]; then
    telephone=`echo "${telephone}${RANDOM:0:${short}}"`
  fi

  # Print the telephone number.
  echo ${telephone}
done
