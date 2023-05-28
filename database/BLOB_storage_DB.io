/*
 Replication:
 master - slave ( async )
 replication factor 5
 -------------
 no sharding
*/

Project BLOB_storage_DB 
{
  database_type: 'Amazon s3'
  Note: 'File storage DB'
 
  Enum file_type
  {
    image
    video
    audio
  }
  
  Table files
  {
    link varchar [pk]
    description text
    type file_type
    file binary
  }
}