if Meteor.isClient

  Template.massMailerForm.rendered = ->
    $("#emailBody"). summernote()
  Template.massMailerForm.events
    'click .send-mass-mail':(e)->
        Meteor.call('sendMassMail',platforms.findOne()._id,$('#emailSubject').val(),$('#emailBody').code())
        e.preventDefault()


  Template.individualMailer.events
    'click .send-individual-mail':(e)->
        emailIds = $('#usersemails').val()
        Meteor.call('sendMultipleMail',platforms.findOne()._id,emailIds,$('#emailSubjectIndi').val(),$('#emailBodyIndi').code())
        e.preventDefault()


  Template.individualMailer.rendered = ->
    $("#emailBodyIndi"). summernote()
  Template.individualMailer.helpers
    userEmails:()->
      emails = []
      console.log Meteor.users.find().fetch()
      for u in Meteor.users.find().fetch()
        emails.push {e:decodeEmail(u.personal_profile.email)}
      emails