require 'telegram_bot'
token = '727022082:AAG0kHDYbuD3UPEWIsJRTMBv2c_zjR4WivM'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
    puts "@#{message.from.username}: #{message.text}"
    command = message.get_command_for(bot)
    
    message.reply do |reply|
        case command
        when /start/i
            reply.text = "Hello! This bot creates push notifications according to some activities you have planned. To see commands: /help."
        when /help/i
            reply.text = "Hello, #{message.from.first_name}. 🤟\nThis bot has following commands:\n🔥/meeting - this command allows to create a meeting at a concrete place and time with a description, and when to remind.\n🔥/deadline - this command allows to create a reminder of your do-to at concrete time and when to remind."
        else
            reply.text = "Wrong command: #{command.inspect}"
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
    end
end
