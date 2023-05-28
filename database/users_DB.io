/*
 Replication:
 master - slave ( sync + async )
 replication factor 5
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
  
  Table messages
  {
    id integer [ ref: - profiles.id ]
    messageIds integer[][] [ ref: < profiles.id, note: 'mapping one to many receiverId - messageIds' ]
  }
  
  Table posts
  {
    id integer [ ref: - profiles.id ]
    postIds integer[] [ note: 'ref: < posts_DB.post.id' ]
  }
  
  Table chats
  {
    id integer [ ref: - profiles.id ]
    chatIds integer[] [ note: 'ref: < chats_DB.post.id' ]
  }
  
  Table relationships
  {
    friends integer[] [ ref: < profiles.id ]
	subscribers integer[] [ ref: < profiles.id ]
  }
}
