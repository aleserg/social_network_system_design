/*
 Replication:
 master - slave ( async )
 replication factor 3
 -------------
 Sharding:
 key-based by ID
*/

Project hashtags_DB 
{
  database_type: 'MongoDB'
  
  Table hashtags
  {
    name varchar[pk]
    postIds integer[] [ note: 'ref: < posts_DB.posts.id. For quick search to other posts with equal hashtag' ]
  }
} 