@sendEmails = (emailList,subject,body)->
  NigerianPrinceGun = new Mailgun(mailgunoptions);

  for e in emailList
      NigerianPrinceGun.send
        'to': e
        'from': mailgunoptions.defaultFrom
        'html': body
        'text': 'someText'
        'subject': subject