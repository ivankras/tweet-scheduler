# Tweet Scheduler

Ruby on Rails applications for scheduling tweets to be posted
Tutorial by Chris Oliver, on [gorails.com](https://github.com/excid3/scheduled_tweets)

----
## Set credentials
(NOTE: update EDITOR for different text-processor)
```rb
$ EDITOR="code --wait" rails credentials:edit --environment=development
```
In the file that opens:
```yml
twitter:
  api_key: TWITTER_API_KEY
  api_secret: TWITTER_API_KEY_SECRET    
```
