# Hello world docker action

Run hammer for Google Cloud Spanner on Github Actions.  
Support following command:
- create
- diff
- apply

## Example configuations

If you are using spanner-emulator, see full example here.
```
jobs:
  test:
    name: test
    services:
        image: gcr.io/cloud-spanner-emulator/emulator:latest
        ports:
          - 9010:9010
          - 9020:9020
    steps:
      - name: Create Spanner instance
~~~~
      - name: test-apply
        uses: ./
        with:
          schema: db/schema.sql
          hammer_cmd: apply
          project_id: emu-project
          instance_id: emu-instance
          database_id: emu-database
          use_emulator: true
```

If you are targeting real Spanner, save your credentials json on GitHub Secret.
```
      - name: test-apply
        uses: ./
        with:
          schema: db/schema.sql
          hammer_cmd: apply
          project_id: emu-project
          instance_id: emu-instance
          database_id: emu-database
          google_application_credentials: ${{secrets.your_gcp_credenttial}} 
```
