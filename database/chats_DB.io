/*
 Replication:
 master - slave ( async )
 replication factor 3
 -------------
 Sharding:
 smart sharding
*/

Project chats_DB 
{
  database_type: 'PostgreSQL'
  Note: 'All about chats'
    
  Table chats
  {
    id integer[pk]
    name varchar
	last_message_id integer
  }
  
  Table messages
  {
    id integer[pk]
	chat_id integer [ note: 'chats_DB.chats.id' ]
    sender_id integer [ note: 'ref: < users_DB.profiles.id' ]
	body text
	created_at timestamp
  }
  
  Table last_seen_messages
  {
    user_id integer
	char_id integer
	message_id integer
  } 
}
