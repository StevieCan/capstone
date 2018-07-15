require 'twilio-ruby'

account_sid = 'AC48f49eac7f33bdd27cc797695634a638'; 
auth_token = '01163fbbff5864724d85470b54be287c';   


@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
                 .create(
                    body: "Golf is on at noon!",
                    from: '+13126295099',
                    to: '+18479518991'
                  )

puts message.sid