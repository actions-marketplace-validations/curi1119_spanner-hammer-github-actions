#!/bin/sh

curl -OL https://github.com/daichirata/hammer/releases/download/v${HAMMER_VER}/hammer-${HAMMER_VER}-linux-amd64.tar.gz
tar xzvf hammer-${HAMMER_VER}-linux-amd64.tar.gz
mv hammer-${HAMMER_VER}-linux-amd64/hammer ./hammer
chmod +x ./hammer
rm -rf hammer-*

url=spanner://projects/$PROJECT_ID/instances/$INSTANCE_ID/databases/$DATABASE_ID

if [ "$USE_EMULATOR" = "true" ]; then
  export SPANNER_EMULATOR_HOST=$EMULATOR_HOST
  echo SPANNER_EMULATOR_HOST exported: "$SPANNER_EMULATOR_HOST"
fi

if [ $GOOGLE_APPLICATION_CREDENTIALS ]; then
  echo $GOOGLE_APPLICATION_CREDENTIALS > creds.json
  url=$url?credentials=cred.json
fi
echo url: $url
echo cmd: $HAMMER_CMD

./hammer $HAMMER_CMD $url $SCHEMA
