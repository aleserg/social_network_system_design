# social_network_system_design
## System design

### Functional requirements:
- profiles
- chats
- personal messages
- notifications about new messages
- posts with media files
- readability of messages
- relationships (friends, subscribers etc.)
- timelines

### Non-functional requirements:
- Availability 99.95%
- 46 150 000 DAU ( 71 000 000 * 0.65 )
- every user writes about 15 messages per day
- every user reads messages about 30 times per day
- every user writes a post per 5 days
- every user reads 10 posts per day 
- no geo-distribution
- no seasonality
- 3000 users max per chat
- 4096 symbols max per message
- 16834 symbols max per post 
- store data indefinitely

### Calculations:
RPS(message write) = 46 150 000 * 15 / 86400 = 8012 

RPS(message read) = 46 150 000 * 30 / 86400 = 16024

Traffic(message write) = 4096 * 2 * 8012 = 65.5 MB/S

Message DB size = 65.5 * 86400 * 365 * 5 = 10 328 TB

Message HDD count = 10 328 / 16 = 645

Message DB shards = 645 / 100 = 7

RPS(post write) = 46 150 000 / 5 / 86400 = 107

RPS(post read) = 46 150 000 * 10 / 86400 = 5341

Traffic(post write) = 107 * 16834 * 2 = 3.6 MB/S
