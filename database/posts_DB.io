/*
 Replication:
 master - slave ( async )
 replication factor 3
 -------------
 Sharding:
 key-based by ID
*/

Project posts_DB 
{
  database_type: 'PostgreSQL'
  Note: 'All about posts'
  
  Table posts 
  {
    id integer [pk, note: 'comments, views and likes of post can be requested by this ID']
    writerId integer [ note: 'ref: < users_DB.profiles.id' ]
    message text
    mediaLinks varchar[] [ note: 'links to media files, added to post. ref: < BLOB_storage_DB.files.link.']
    hashtagNames varchar[] [ note: 'ref: < hashtags.name' ]
    created_at timestamp
  }
  
  Table comments
  {
    id integer [ ref: - posts.id ]
    writerIds integer[] [ note: 'ref: < users_DB.profiles.id' ]
    messages text[]
  }
  
  Table likes
  {
    id integer [ ref: - posts.id ]
    likerIds integer[] [ note: 'ref: < users_DB.profiles.id' ]
  }
  
  Table viewers
  {
    id integer [ ref: - posts.id ]
    viewerIds integer[] [ note: 'ref: < users_DB.profiles.id' ]
  }
}