/*
 Replication:
 master - slave ( async )
 replication factor 3
 -------------
 Sharding:
 key-based by pair (type, placement_id)
*/

Project messages_DB 
{
  database_type: 'MongoDB'
  
  enum message_placement_type
  {
    private [ note: 'user - to user' ]
	chat [ note: 'user - to users group' ]
  }
  
  Table messages
  {
    id integer[pk]
	type message_placement_type
	placement_id integer [ note: 'if type == private, then equal to senderId, else ref: - chats_DB.chats.id' ]
    senderId integer [ note: 'ref: < users_DB.profiles.id' ]
	body text
    wasViewed bool
	created_at timestamp
  }
}