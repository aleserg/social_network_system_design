/*
 Replication:
 master - slave ( async )
 replication factor 3
 -------------
 Sharding:
 key-based by ID
*/

Project chats_DB 
{
  database_type: 'PostgreSQL'
  Note: 'All about posts'
    
  Table chats
  {
    id integer[pk]
    name varchar
    userIds integer[] [ note: 'ref: < users_DB.profiles.id' ]
    messageIds integer[] [ note: 'ref: < messages_DB.messages.id' ]
  }
}