if Rails.env.development? || Rails.env.production?
   ActionMailer::Base.delivery_method = :smtp
   ActionMailer::Base.smtp_settings = {
     port:              587,
     address:           'smtp.mailgun.org',
     user_name:         ENV['MAILGUN_SMTP_LOGIN'],
     password:          ENV['MAILGUN_SMTP_PASSWORD'],
     domain:            'sandbox2694eea1d90647b7b9a80c747f9ca75d.mailgun.org',
     authentication:    :plain,
     content_type:      'text/html'
   }
   ActionMailer::Base.delivery_method = :smtp

   ActionMailer::Base.raise_delivery_errors = true

 end
