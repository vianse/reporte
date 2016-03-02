class UserMailer < ActionMailer::Base
  default from: 'juancarlos.santiago@vianse.mx'

  def follow_up_email(email)
    RestClient.post "https://api:key-e7d79c66e74391fdf48b657624f23ddc@api.mailgun.net/v3/sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org/messages",
	:from => "Pronostic - Cierre de Mes <mailgun@sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org>",
	:to => email,
	:subject => "Cierre de Mes",
	:html => (render_to_string(template: "../views/template/template")).to_str
  end
end