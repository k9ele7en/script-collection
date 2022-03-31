# As for the keys with specials characters, you need to enclose them inside double quotes and brackets : .annotations.["artifacthub.io/images"]
# install

ENV yq_VERSION="v4.23.1"
ENV yq_BINARY="yq_linux_amd64"
RUN wget https://github.com/mikefarah/yq/releases/download/${yq_VERSION}/${yq_BINARY}.tar.gz -O - |\
  tar xz && mv ${yq_BINARY} /usr/bin/yq

# run:

# file.yml
```
annotations:
  artifacthub.io/changes: |
    - Fixed linting issues.
  artifacthub.io/images: |
    - name: transmission
      image: ghcr.io/linuxserver/transmission:3.00-r0-ls75
```

image="foo"
yq eval '.annotations.["artifacthub.io/images"] = "'${image}'"' file.yml
#       |              |                     |    ||        |||
#       |              |                     |    ||        ||└> (a.1) close yq query
#       |              |                     |    ||        |└> (c) end string value
#       |              |                     |    ||        └> (a.2) open yq query (end concatenation)
#       |              |                     |    |└> (a.2) close yq query (start concatenation)
#       |              |                     |    └> (c) start string value
#       |              |                     └> (b) end key w/ special chars
#       |              └> (b) start key w/ special chars
#       └> (a.1) open yq query

#from ENV VAR
TARGET_DATA_DIR=$1 yq -i '.data_directory = strenv(TARGET_DATA_DIR)' config.yml

# ex: sh script/set_data_directory.sh /data/Data_OK

###########################
### find all key by parent level, set base on ENV Var

#!/bin/sh
key1="ABC"
key2="changed"
key3=FALSE

# cat ../config.yml | yq e '.parent | has("$key1")'

# echo ------
# has_eng=$(cat ../config.yml | yq e '.parent | has("$key1")')
# if [ "$has_eng" == "true" ]; then
#     echo has key1
# fi
# echo ---------

ENG_KEY=$(yq e '(.parent | keys)[]' ../config.yml)

for KEY in $ENG_KEY
do
    if [[ -z ${KEY} || ! -v ${KEY} ]]; then
        continue
    else
        #variable variables
        ENV_VAL=${!KEY}
        echo key: $KEY change to: $ENV_VAL
        yq -i ".parent.${KEY} = \"$ENV_VAL\"" ../config.yml
    fi
done