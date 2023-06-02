/*
 Replication:
 master - slave ( sync + async )
 replication factor 3
 -------------
 Sharding:
 key-based by ID
*/

Project users_DB 
{
  database_type: 'PostgreSQL'
  Note: 'All about users'

  Table profiles
  {
    id integer [pk, note: 'messages, chats and posts of user can be requested by this ID' ]
    first_name varchar
    last_name varchar
    imageLink varchar [note: 'ref: < BLOB_storage_DB.files.link']
    city varchar
    interests text [note: 'About me']
    regDate timestamp [note: 'User registration timestamp']
  }
}
