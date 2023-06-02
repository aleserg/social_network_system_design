/*
 Replication:
 master - slave ( async )
 replication factor 3
 -------------
 Sharding:
 key-based by post_ID
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
	hashtagsIDs integer[] [ ref: < hashtags.id ]
    created_at timestamp
  }
  
  Table hashtags
  {
    id integer
    name varchar
	postId integer [ ref: < posts.id ]
  }
  
  Table comments
  {
    id integer [ ref: - posts.id ]
	reply_ids integer[] [ ref: < comments.id ]
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
