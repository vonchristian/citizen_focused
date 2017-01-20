class TaxpayerSignUpNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

   # send a signup email to the taxpayer, pass in the taxpayer object that   contains the taxpayer's email address
   def send_signup_email(taxpayer)
     @taxpayer = taxpayer
     mail( :to => @taxpayer.email,
     :subject => 'Thanks for signing up for our amazing app' )
   end
 end
