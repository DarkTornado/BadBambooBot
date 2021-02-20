###
죽창봇
© 2018-2021 Dark Tornado, All rights reserved.
You죽창보다 똑똑한 AI, 죽창봇입니다.
###

preChat = []
sdcard = File.getSdcardPath()
says = ["조횽히해!", ".", "킁", "ㅋ?", "야", "터미널은 아이피 따는 프로그램이야", "VPN으로 카카오톡 정지 뚫을 수 있어"]

saveData = (name, value) -> FileStream.write sdcard+"/죽창봇/"+name+".txt", value
readData = (name) -> FileStream.read sdcard+"/죽창봇/"+name+".txt"

onLoaded = (ctx) -> 
    folder = new java.io.File sdcard+"/죽창봇/"
    folder.mkdirs()
    files = folder.listFiles()
    for file in files
        says.push FileStream.read file
    print "채팅 " + files.length + "개 로드 완료."


response = (room, msg, sender, isGroupChat, replier, ImageDB) -> 
    return if !isGroupChat
    return if msg is preChat[room]
    msg0 = preChat[room]
    preChat[room] = msg

    if msg is "You죽창" or msg is "유죽창" or msg is "죽창"
        rr = Math.floor(Math.random() * says.length)
        replier.reply says[rr]
    replier.reply "You죽창보다 똑똑한 AI, 죽창봇입니다." if msg is "/도움말" or msg is "/죽창봇" or msg is "죽창봇"

    if sender is "You죽창"
        saveData msg0, msg if msg.includes("\n")
        says.push msg
    
    if msg is "/DB"
        folder = new java.io.File sdcard+"/죽창봇/"
        files = folder.listFiles()
        replier.reply "0개입니다." if files is null
        replier.reply files.length + "개입니다." if files isnt null

    rr = Math.floor Math.random() * 10
    
    if rr is 0
        chat = readData msg
        replier.reply chat if chat isnt null
